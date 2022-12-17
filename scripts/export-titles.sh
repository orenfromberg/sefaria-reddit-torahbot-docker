#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# this script will print a json file of all Sefaria titles for copying to the website.
docker exec torahbot bash -c "python torahbot/scripts/get-titles.py"
