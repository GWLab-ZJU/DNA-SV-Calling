#!/usr/bin/env bash
set -ue
cd "$(readlink -f "$(dirname "${0}")")"
rm -f *.log *.html *.zip
