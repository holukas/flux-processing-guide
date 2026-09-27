---
title: "bico"
---

bico converts the binary raw data files written by the sonicread logging script to CSV files that EddyPro can read. Raw data files from rECord are already CSV files and skip this step.

- **Input:** binary raw data files from sonicread, 20 Hz.
- **Output:** one CSV file per raw data file with a 3-row header, optionally gzip-compressed.
- **How it works:** a data-block spec for each instrument describes its byte layout, and bico decodes every file into labelled columns. Supported are sonic anemometers and gas analyzers (IRGA, QCL, LGR).
- **Also writes:** per-file statistics, optional plots, a log and a copy of the settings used, all in one output folder per run.
- **Runs on:** your own computer, with a terminal interface or from the command line for scheduled runs.

bico is built for the binary format of the ETH Grassland Sciences group, not as a general converter.

Source code and installation: [github.com/holukas/bico](https://github.com/holukas/bico)
