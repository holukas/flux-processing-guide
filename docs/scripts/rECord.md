---
title: "rECord"
---

rECord (Robust Eddy Covariance Data Acquisition) is a raw data logger for eddy covariance. It reads the sonic anemometer over a serial port, merges in the gas analyzer records and writes the combined records to files.

- **Output:** CSV files in TOA5 format, 20 Hz, with a 4-row header.
- **No conversion needed:** the files go directly to [fluxrun](fluxrun.md), without [bico](bico.md).
- **Runs on:** the data logger at the site.

*To be written.*
