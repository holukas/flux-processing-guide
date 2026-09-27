#!/usr/bin/env pwsh
#
# Local preview: Quarto's live-reloading dev server. Opens the browser and
# refreshes as you edit docs/*.md.
#
#   ./preview.ps1
#
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot
uv run quarto preview docs
