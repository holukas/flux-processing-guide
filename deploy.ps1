#!/usr/bin/env pwsh
#
# Build the guide and publish it to GitHub Pages.
#
# Renders the Quarto website (docs/ -> docs/_build/html) and publishes the
# output to the gh-pages branch with ghp-import. ghp-import commits and (with -p)
# force-pushes gh-pages; it does not touch your source branch or working tree.
#
# Usage:
#   ./deploy.ps1              # build + publish
#   ./deploy.ps1 -NoPublish   # build only
#
# Requires uv (the environment provides quarto-cli and ghp-import).
# Published site: https://holukas.github.io/flux-processing-guide/

[CmdletBinding()]
param(
    [switch]$NoPublish,
    [string]$Remote = 'origin',
    [string]$Branch = 'gh-pages'
)

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

function Invoke-Step {
    param([string]$Desc, [scriptblock]$Cmd)
    Write-Host "==> $Desc" -ForegroundColor Cyan
    & $Cmd
    if ($LASTEXITCODE -ne 0) { throw "Step failed: $Desc (exit $LASTEXITCODE)" }
}

Invoke-Step 'Rendering Quarto website (docs/)' { uv run quarto render docs }

if ($NoPublish) {
    Write-Host "Build complete. Output: docs/_build/html (publish skipped)." -ForegroundColor Green
    return
}

# -n  write .nojekyll (stop GitHub from running Jekyll over asset dirs)
# -o  no history: replace gh-pages with one fresh commit per deploy
# -f  force (required by -o), -p  push
$msg = "Deploy site {0}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm')
Invoke-Step "Publishing docs/_build/html to $Remote/$Branch" {
    uv run ghp-import docs/_build/html -n -o -f -p -r $Remote -b $Branch -m $msg
}

Write-Host "Deployed to $Remote/$Branch." -ForegroundColor Green
Write-Host "Live (after Pages rebuilds): https://holukas.github.io/flux-processing-guide/" -ForegroundColor Green
