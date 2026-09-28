---
title: "fluxrun"
---

fluxrun is a Python wrapper for [EddyPro](https://www.licor.com/env/products/eddy_covariance/eddypro) (v7.0.9). EddyPro calculates the fluxes from the raw data; fluxrun takes care of the file handling, checks and plots around it.

## Input

- Raw data CSV files, from [bico](bico.md) (3-row header) or [rECord](rECord.md) (4-row header), compressed (`.gz`) or not.
- An EddyPro settings file (`.eddypro`) with a `.metadata` file of the same name next to it.

The raw data files are usually stored compressed (`.gz`), because compression makes them much smaller. They come compressed from two places:

- **bico** can compress the CSV files it writes when it converts the binary files from sonicread.
- **rECord** records CSV files and then compresses them.

fluxrun decompresses the `.gz` files itself during the flux calculation, so they don't need to be unpacked first.

## Two runs

1. **Level-0 run:** gives preliminary fluxes. They are used to refine the settings, e.g. the time lag.
2. **Level-1 run:** the final run with the refined settings, on the same raw data. It also uses the screened meteo data, formatted for EddyPro with the [diive](diive.md) notebook `FormatMeteoForEddyProFluxProcessing.ipynb`.

## What fluxrun does

- Finds the raw data files by file name pattern and date range, and skips empty files.
- Decompresses `.gz` files into the run's output folder, and can delete the decompressed files afterwards.
- Replaces non-numeric values with `-9999`, the missing value EddyPro expects in the raw data files.
- Runs EddyPro's raw processing, then its flux computation and correction.
- Plots raw data availability, raw data aggregates and a summary of the EddyPro output.
- Writes everything to one output folder per run, named with a run ID (`FR-YYYYMMdd-HHMMSS`), with a main log and a log of warnings and errors.
- **Runs on:** your own computer, with a graphical interface or from the command line.

## Output

The EddyPro fluxnet output file (30 min) goes on to the [diive flux processing chain](../Flux_Processing_Chain.md).

Source code and installation: [github.com/holukas/fluxrun](https://github.com/holukas/fluxrun)
