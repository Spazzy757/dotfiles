#!/usr/bin/env bash
# Install every tool in tools.json that has a "url" (binary/tarball) or "git" (clone).
# Entries with only "version" are read by setup.sh. Reinstalls when the version changes.
#
# Fields: version | url | git | deb (url of a .deb, installed with apt) | extract (tar member -> ~/.local/bin)
#         dir:true (unpack whole tarball to ~/.local/opt/<name>) + bin (path to symlink)
# URL placeholders: {version} {ver} (no leading v) {arch} (amd64|arm64) {uname_arch} (x86_64|arm64) {os_version} (e.g. 26.04)
set -euo pipefail

JSON=${1:-$(dirname "$0")/../tools.json}
ARCH=$(dpkg --print-architecture)
UARCH=$(uname -m); [ "$UARCH" = aarch64 ] && UARCH=arm64
BIN=$HOME/.local/bin OPT=$HOME/.local/opt MARK=$HOME/.local/share/setup-versions
OSV=$(. /etc/os-release && echo "$VERSION_ID")
mkdir -p "$BIN" "$OPT" "$MARK"

while read -r name; do
  f() { jq -r --arg n "$name" ".[\$n].$1 // empty" "$JSON"; }
  v=$(f version)
  [ "$(cat "$MARK/$name" 2>/dev/null)" = "$v" ] && continue
  printf '==> %s %s\n' "$name" "$v"

  sub() { local s=${1//\{version\}/$v}; s=${s//\{ver\}/${v#v}}; s=${s//\{arch\}/$ARCH}; s=${s//\{uname_arch\}/$UARCH}; echo "${s//\{os_version\}/$OSV}"; }

  if [ -n "$(f git)" ]; then
    d=$HOME/.$name
    [ -d "$d/.git" ] || git clone -q "$(f git)" "$d"
    git -C "$d" fetch -q --tags && git -C "$d" checkout -q "$v"
  elif [ -n "$(f deb)" ]; then
    curl -fsSL -o "$MARK/$name.deb" "$(sub "$(f deb)")"
    sudo apt-get install -y --allow-downgrades "$MARK/$name.deb" && rm -f "$MARK/$name.deb"
  else
    url=$(sub "$(f url)")
    if [ -n "$(f dir)" ]; then
      rm -rf "${OPT:?}/$name" && mkdir -p "$OPT/$name"
      curl -fsSL "$url" | tar -xz --strip-components=1 -C "$OPT/$name"
      ln -sf "$OPT/$name/$(f bin)" "$BIN/$(basename "$(f bin)")"
    elif [ -n "$(f extract)" ]; then
      m=$(sub "$(f extract)")
      curl -fsSL "$url" | tar -xz -C "$BIN" --strip-components="$(tr -dc / <<<"$m" | wc -c)" "$m"
    else
      curl -fsSL -o "$BIN/$name" "$url" && chmod +x "$BIN/$name"
    fi
  fi
  echo "$v" > "$MARK/$name"
done < <(jq -r 'to_entries[] | select(.value.url or .value.git or .value.deb) | .key' "$JSON")
