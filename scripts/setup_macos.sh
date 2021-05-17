#!/usr/local/bin/bash
# Helper script to setup macos
set -e

curl -fsSL https://get.comtrya.dev | sh

comtrya comtrya/ -m macos
comtrya comtrya/ -m bash-it

