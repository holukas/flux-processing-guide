---
title: "sonicread"
---

sonicread is a real-time logging script for eddy covariance raw data ([Eugster & Plüss, 2010](https://doi.org/10.1016/j.agrformet.2009.12.008)). It runs on the data logger at the site and merges the incoming raw data streams of the sonic anemometer and the gas analyzers into one file.

- **Output:** binary raw data files, 20 Hz, one file per six hours. The start time of each file is in its file name.
- **What the files lack:** timestamps, variable names and units. [bico](bico.md) adds names and units when it converts the files to CSV.
- **Runs on:** the data logger at the site.

The file format is described in [Raw Data: Eddy Covariance](../Raw_Data_EC.md).
