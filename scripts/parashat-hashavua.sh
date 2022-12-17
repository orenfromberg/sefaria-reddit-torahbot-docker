#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

docker exec torahbot bash -c "python torahbot/scripts/parashat-hashavua.py"
