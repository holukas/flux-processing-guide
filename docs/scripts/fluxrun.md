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

1. **L0 · Preliminary run:** gives preliminary fluxes, with relaxed settings and a wide time lag window. They are used for checks and to refine the settings, e.g. the time lag. See [L0](../L0.md).
2. **L1 · Final flux run:** the final run with the refined settings, on the same raw data. It also uses the screened meteo data ([biomet data](../Meteo_For_EddyPro.md#variables)), formatted for EddyPro with the [diive](diive.md) notebook `FormatMeteoForEddyProFluxProcessing.ipynb`. See [L1](../L1.md).

## Features

- Finds the raw data files by file name pattern and date range, and skips empty files.
- Decompresses `.gz` files into the run's output folder, and can delete the decompressed files afterwards.
- Replaces non-numeric values with `-9999`, the missing value EddyPro expects in the raw data files.
- Runs EddyPro's raw processing, then its flux computation and correction.
- Plots raw data availability, raw data aggregates and a summary of the EddyPro output.
- Writes everything to one output folder per run, named with a run ID (`FR-YYYYMMdd-HHMMSS`), with a main log and a log of warnings and errors.
- **Runs on:** your own computer, with a graphical interface or from the command line.

## Tips

- **More output than EddyPro alone:** e.g. the complete EddyPro log, which shows problems such as the fallback of the spectral correction.
- **File name pattern:** use placeholders for the date and time, e.g. `yyyy`, `mm`, `dd`, `HH`, `MM`. The extension must be right, because `.gz` files are decompressed first.
- **Start and end:** refer to the date and time in the file names, not to the half-hourly fluxes. Both are included.
- **Year boundary:** a six-hour sonicread file that starts in the evening of 31 December also holds the first hours of the next year. Copy that file to the source folder of the next year's run.
- **Run without EddyPro:** switching off the flux calculation still checks which files are found and plots their availability.
- **Decompressed files:** they need a lot of disk space. fluxrun can delete them after the run, unless you need them, e.g. for the L1 run after an OPENLAG run.
- **Settings:** saved when the run starts, also to the output folder of the run.
- **Versions:** fluxrun is updated with new EddyPro versions and bug fixes. The log shows the fluxrun version, e.g. to check for the [empty SSITC flags](../L1.md#known-issues) of older versions.

## Output

The EddyPro fluxnet output file (30 min) goes on to the [diive flux post-processing chain](../Flux_Post_Processing_Chain.md).

Source code and installation: [github.com/holukas/fluxrun](https://github.com/holukas/fluxrun)
