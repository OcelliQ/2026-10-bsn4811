#!/usr/bin/env bash
# Fetch the latest model price charts from OcelliQ/ai-models-chart's public
# rolling `charts` release into figures/ai-models-chart/ (gitignored). No login
# needed. Run it before compiling, and again close to the lecture.
set -euo pipefail

url="https://github.com/OcelliQ/ai-models-chart/releases/download/charts/charts.zip"
root="$(cd "$(dirname "$0")/.." && pwd)"
dest="$root/figures/ai-models-chart"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL "$url" -o "$tmp/charts.zip"
unzip -q "$tmp/charts.zip" -d "$tmp/charts"
rm -rf "$dest"
mv "$tmp/charts" "$dest"
echo "Fetched charts into ${dest#"$root"/}:"
ls "$dest/svg-paths"
