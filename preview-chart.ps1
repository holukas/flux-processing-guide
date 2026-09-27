#!/usr/bin/env pwsh
#
# Working preview of the processing chain chart, reloading on every save.
# Serves the repo root and opens tools/chart-preview.html. Ctrl+C stops it.
#
#   ./preview-chart.ps1
#
param([int]$Port = 8897)
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot
Start-Process "http://localhost:$Port/tools/chart-preview.html"
uv run python -m http.server $Port --bind 127.0.0.1
