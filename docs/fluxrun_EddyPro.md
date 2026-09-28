---
title: "fluxrun + EddyPro"
---

[EddyPro](https://www.licor.com/env/products/eddy_covariance/eddypro) (v7.0.9) calculates the fluxes from the raw data. [fluxrun](scripts/fluxrun.md) runs EddyPro and takes care of the file handling, checks and plots around it.

## Input

- Raw data CSV files, from [bico](scripts/bico.md) (3-row header) or [rECord](scripts/rECord.md) (4-row header), compressed (`.gz`) or not.
- An EddyPro settings file (`.eddypro`) with a `.metadata` file of the same name next to it.

## Two runs

1. **Level-0 run:** gives preliminary fluxes. They are used to refine the settings, e.g. the time lag.
2. **Level-1 run:** the final run with the refined settings, on the same raw data. It also uses the screened meteo data, formatted for EddyPro with the [diive](scripts/diive.md) notebook `FormatMeteoForEddyProFluxProcessing.ipynb`.

## Output

The EddyPro fluxnet output file (30 min) goes on to the [diive flux processing chain](Flux_Processing_Chain.md).
