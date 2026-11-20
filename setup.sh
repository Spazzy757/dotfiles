#!/usr/bin/env bash
# Bootstrap a fresh Ubuntu/Debian laptop. Idempotent: safe to re-run.
#   curl -fsSL https://raw.githubusercontent.com/Spazzy757/dotfiles/main/setup.sh | bash
# apt list: packages.txt. Pinned tools: tools.json (installed by scripts/install-tools.sh).
set -euo pipefail

DOTFILES="$HOME/repos/dotfiles"
BIN="$HOME/.local/bin"
MARK="$HOME/.local/share/setup-versions"
mkdir -p "$BIN" "$MARK" "$HOME/repos/spazzy" "$HOME/repos/vandebron"
log() { printf '\n==> %s\n' "$*"; }
ver()  { jq -r ".$1.version" tools.json; }
# need <tool> <version>: true if not installed at that version; ok records it
need() { [ "$(cat "$MARK/$1" 2>/dev/null)" != "$2" ]; }
ok()   { echo "$2" > "$MARK/$1"; }

# --- repo (first: packages.txt and tools.json live in it) ------------------
if [ ! -d "$DOTFILES/.git" ]; then
  log "clone dotfiles"
  command -v git >/dev/null || { sudo apt-get update && sudo apt-get install -y git; }
  git clone https://github.com/Spazzy757/dotfiles.git "$DOTFILES"
fi
cd "$DOTFILES"

# --- apt -------------------------------------------------------------------
log "apt packages"
sudo apt-get update
grep -vE '^\s*(#|$)' packages.txt | xargs sudo apt-get install -y
ln -sf "$(command -v fdfind)" "$BIN/fd"   # Debian names it fdfind

# --- pinned binaries and git-cloned tools ----------------------------------
./scripts/install-tools.sh

# --- tools that need their own installer -----------------------------------
if ! command -v docker >/dev/null; then
  log "docker"
  curl -fsSL https://get.docker.com | sudo sh
  sudo usermod -aG docker "$USER"   # takes effect after re-login
fi

v=$(ver terraform)
if need terraform "$v"; then
  log "terraform $v"
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/hashicorp.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$VERSION_CODENAME") main" \
    | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null
  sudo apt-get update && sudo apt-get install -y --allow-downgrades "terraform=$v-1"
  ok terraform "$v"
fi

v=$(ver rust)
if need rust "$v"; then
  log "rust $v"
  command -v rustup >/dev/null || curl -fsSL https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain none
  "$HOME/.cargo/bin/rustup" toolchain install "$v" && "$HOME/.cargo/bin/rustup" default "$v"
  ok rust "$v"
fi

v=$(ver bun)
if need bun "$v"; then
  log "bun $v"
  curl -fsSL https://bun.sh/install | bash -s "bun-v$v"
  ok bun "$v"
fi

# claude self-updates, so it is not pinned
command -v claude >/dev/null || { log "claude code"; curl -fsSL https://claude.ai/install.sh | bash; }

# --- stow ------------------------------------------------------------------
log "stow"
# Skip git-crypt files while locked: stowing ciphertext breaks git's [include]
ignore=()
if head -c 9 git/.gitemail 2>/dev/null | grep -q GITCRYPT; then
  ignore=(--ignore='\.gitemail$' --ignore='\.gitconfig\.work$' --ignore='\.git-credentials$')
  LOCKED=1
fi

# Move aside distro defaults (.bashrc etc.) that would make stow conflict
backup() {  # pkg target
  for f in $(cd "$1" && find . -type f | sed 's|^\./||'); do
    t="$2/$f"
    [ -e "$t" ] && [ ! -L "$t" ] && mv -v "$t" "$t.bak"
  done
  return 0
}
mkdir -p ~/.config/nvim ~/.config/ghostty ~/.claude
for p in git bash tmux;           do backup $p ~;                   stow -v -R "${ignore[@]}" -t ~ $p; done
backup nvim ~/.config/nvim;       stow -v -R -t ~/.config/nvim nvim
backup ghostty ~/.config/ghostty; stow -v -R -t ~/.config/ghostty ghostty
backup claude ~/.claude;          stow -v -R -t ~/.claude claude

# --- next steps ------------------------------------------------------------
log "done"
cat <<EOF
Manual steps:
  1. gpg --import <your-key>; cd $DOTFILES && git-crypt unlock; re-run ./setup.sh
  2. gh auth login; ssh key -> GitHub; git -C $DOTFILES remote set-url origin git@github.com:Spazzy757/dotfiles.git
  3. Log out/in (docker group, login shell), then open nvim and run :Mason
EOF
[ "${LOCKED:-}" ] && echo "  (secrets still locked: git work config skipped)"
exit 0
