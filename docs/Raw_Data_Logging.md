---
title: "Raw data logging and conversion"
---

A logger on site records the eddy covariance raw data: the sonic anemometer and the gas analyzers, at 20 Hz. [bico](scripts/bico.md) converts the binary files from sonicread to CSV files that EddyPro can read.

- **Boxes:** 1 and 2 (logging), 3 and 16 (conversion) in the [processing chain](Processing_Chain.md).
- **Next step:** [L0 preliminary run](L0.md).

## Logging

- **Runs on:** the data logger at the site.
- **Next step:** [conversion](#conversion) for sonicread files, the [L0 preliminary run](L0.md) for rECord files.

### Two loggers

| | [sonicread](scripts/sonicread.md) (1) | [rECord](scripts/rECord.md) (2) |
|---|---|---|
| Files | binary | CSV, TOA5 format |
| Names and units | not in the file; bico adds them | in the 4-row header |
| New file | every six hours | every N × 30 min, or once a day |
| Format | [EC raw data: sonicread](data/Raw_Data_EC.md) | [EC raw data: rECord](data/Raw_Data_EC_rECord.md) |

rECord replaces sonicread.

### Regular checks

Check the logger regularly, e.g. once a week:

- Is the logger running?
- Do data arrive from the sonic anemometer and each gas analyzer?
- How much disk space is left?
- Is the newest file growing?
- Are there files for each of the last 7 days?

## Conversion {#conversion}

[bico](scripts/bico.md) converts the binary raw data files from sonicread to CSV files that EddyPro can read.

- **Input:** binary raw data files from [sonicread](scripts/sonicread.md), 20 Hz.
- **Output:** one CSV file per raw data file, with a 3-row header, optionally compressed (`.gz`).
- **Runs on:** your own computer.
- **Next step:** [L0 preliminary run](L0.md).

Raw data files from [rECord](scripts/rECord.md) are already CSV files and skip this step.

- **Why:** EddyPro needs a regular format, where every row has the same number of values. The binary files from sonicread are irregular.
- **After the conversion:** the files are human-readable.
