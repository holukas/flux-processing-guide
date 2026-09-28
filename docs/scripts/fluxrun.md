---
title: "fluxrun"
---

fluxrun is a Python wrapper for [EddyPro](https://www.licor.com/env/products/eddy_covariance/eddypro) (v7.0.9). EddyPro calculates the fluxes; fluxrun takes care of the file handling, checks and plots around it.

- Finds the raw data files by file name pattern and date range, and skips empty files.
- Reads CSV files from [bico](bico.md) (3-row header) or [rECord](rECord.md) (4-row header), and decompresses `.gz` files.
- Replaces non-numeric values with `-9999`.
- Runs EddyPro's raw processing, then its flux computation and correction.
- Plots raw data availability, raw data aggregates and a summary of the EddyPro output.
- Writes everything to one output folder per run, named with a run ID (`FR-YYYYMMdd-HHMMSS`), with a main log and a log of warnings and errors.
- **Runs on:** your own computer, with a graphical interface or from the command line.

How the flux calculation is run in two steps: [fluxrun + EddyPro](../fluxrun_EddyPro.md).

Source code and installation: [github.com/holukas/fluxrun](https://github.com/holukas/fluxrun)
