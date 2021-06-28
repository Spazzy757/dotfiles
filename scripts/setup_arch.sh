#!/usr/local/bin/bash
# Helper script to setup arch linux
set -e

curl -fsSL https://get.comtrya.dev | sh

comtrya comtrya/ -m arch
comtrya comtrya/ -m bash-it

