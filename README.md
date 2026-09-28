# Flux Processing Guide

Guide to processing eddy covariance and meteo data, from raw data to quality-controlled fluxes: bico, fluxrun, EddyPro, dataflow and diive.

The guide is a Quarto website in `docs/`.

```
uv sync                # installs Quarto and ghp-import
./preview.ps1          # live preview while editing
./preview-chart.ps1    # working preview of the chart, reloads on every save
./deploy.ps1           # build and publish to GitHub Pages by hand
```

A push to `main` that changes `docs/` publishes the site through GitHub Actions (`.github/workflows/publish.yml`). It renders the site and pushes it to the `gh-pages` branch.
