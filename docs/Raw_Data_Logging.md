---
title: "Raw data logging"
---

A logger on site records the eddy covariance raw data: the sonic anemometer and the gas analyzers, at 20 Hz.

- **Boxes:** 1 and 2 in the [processing chain](Processing_Chain.md).
- **Runs on:** the data logger at the site.
- **Next step:** [raw data conversion](Raw_Data_Conversion.md) for sonicread files, the [L0 preliminary run](L0.md) for rECord files.

## Two loggers

| | [sonicread](scripts/sonicread.md) (1) | [rECord](scripts/rECord.md) (2) |
|---|---|---|
| Files | binary | CSV, TOA5 format |
| Names and units | not in the file; bico adds them | in the 4-row header |
| New file | every six hours | every N × 30 min, or once a day |
| Format | [EC raw data: sonicread](data/Raw_Data_EC.md) | [EC raw data: rECord](data/Raw_Data_EC_rECord.md) |

rECord replaces sonicread.
