---
title: "rECord"
---

::: {.callout-note title="Summary"}
rECord logs the raw data of the sonic anemometer and the gas analyzers on site into one CSV file per 30 min, at 20 Hz. It is an updated version of [sonicread](sonicread.md), in use since 2023, and its files need no conversion.
:::

rECord (Robust Eddy Covariance Data Acquisition) is a logging script for eddy covariance raw data. It reads the sonic anemometer over a serial port, merges in the gas analyzer records and writes the combined records to files.

- **Output:** CSV files in TOA5 format, 20 Hz, with a 4-row header. After recording, the files are compressed (`.gz`) to save storage space.
- **No conversion needed:** the files go directly to [fluxrun](fluxrun.md), without [bico](bico.md).
- **Runs on:** the data logger at the site, a Linux computer.

## Operation

- **Sonic anemometer:** sets the timing. Each sonic record becomes one row in the file, at 20 Hz.
- **Supported sonics:** Gill HS-50 and Gill R3-50.
- **Gas analyzers:** a separate process reads each analyzer and passes its records to rECord. rECord puts each analyzer record into the row of the matching sonic record.
- **Missing analyzer records:** replaced by the last valid record, up to a set number of times. After that the values are missing.
- **Status:** one status column per analyzer marks rows where data were missing, repeated or discarded.
- **Files:** a new file starts every 30 min at all sites. The finished file is then compressed.
- **Settings:** two TOML files, one for rECord (variables, units, file format, instruments) and one with the settings sent to the sonic.

The file format is described in [EC raw data: rECord](../data/Raw_Data_EC_rECord.md).

Live view of the incoming data: [ecvis](https://github.com/holukas/record-ec-visualizer-tui), a terminal dashboard. The source code of rECord is not public.
