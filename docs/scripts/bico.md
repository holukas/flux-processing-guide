---
title: "bico"
---

::: {.callout-note title="Summary"}
bico converts the binary raw data files from [sonicread](sonicread.md) to CSV files with a regular format that EddyPro can read. It adds variable names and units and writes one CSV file per raw data file.
:::

Raw data files from [rECord](rECord.md) are already CSV files and skip this step.

- **Input:** binary raw data files from [sonicread](sonicread.md), 20 Hz.
- **Output:** one CSV file per raw data file with a 3-row header, optionally gzip-compressed.
- **Regular format:** EddyPro needs every row to have the same number of values. The binary files from [sonicread](sonicread.md) are irregular.
- **Readable:** unlike the binary files, the CSV files are human-readable.
- **Data-block specs:** a data-block spec for each instrument describes its byte layout, and bico decodes every file into labelled columns. Supported are sonic anemometers and gas analyzers (IRGA, QCL, LGR).
- **Also writes:** per-file statistics, optional plots, a log and a copy of the settings used, all in one output folder per run.
- **Runs on:** a local installation, on demand with a terminal interface, or automatically from the command line.

bico is built for the binary format of the ETH Grassland Sciences group, not as a general converter. The format itself is described in [EC raw data: sonicread](../data/Raw_Data_EC.md).

Source code and installation: [github.com/holukas/bico](https://github.com/holukas/bico)
