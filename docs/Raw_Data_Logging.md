---
title: "Raw data logging and conversion"
---

::: {.callout-note title="Summary"}
Eddy covariance raw data from the sonic anemometer and the gas analyzers are logged on site at 20 Hz, with [sonicread](scripts/sonicread.md) (binary files, since 2005) or [rECord](scripts/rECord.md) (CSV files, since 2023). [bico](scripts/bico.md) converts the binary files to CSV files, which go to the [L0 preliminary run](L0.md) together with the [rECord](scripts/rECord.md) files.
:::

- **Boxes:** 1 and 2 (logging), 3 and 16 (conversion) in the [processing chain](index.md).
- **Runs on:** the data logger at the site. The [conversion](#conversion) runs on a local installation.
- **Next step:** [conversion](#conversion) for [sonicread](scripts/sonicread.md) files, the [L0 preliminary run](L0.md) for [rECord](scripts/rECord.md) files.

## Two logging scripts

|                 | [sonicread](scripts/sonicread.md) (1)              | [rECord](scripts/rECord.md) (2)                   |
| --------------- | -------------------------------------------------- | ------------------------------------------------- |
| Used since      | 2005                                               | 2023                                              |
| Files           | binary                                             | CSV, TOA5 format                                  |
| Names and units | not in the file; [bico](scripts/bico.md) adds them | in the 4-row header                               |
| New file        | every six hours                                    | every 30 min                                      |
| In use (September 2026) | some sites                                  | many sites                                        |
| Format          | [EC raw data: sonicread](data/Raw_Data_EC.md)      | [EC raw data: rECord](data/Raw_Data_EC_rECord.md) |

[rECord](scripts/rECord.md) is an updated version of [sonicread](scripts/sonicread.md).

## Conversion {#conversion}

EddyPro cannot read the binary files from [sonicread](scripts/sonicread.md). [bico](scripts/bico.md) converts them to CSV files with a regular format. Files from [rECord](scripts/rECord.md) are already CSV files and skip this step. Details are on the [bico](scripts/bico.md) page.

## Regular checks

The data logger is checked regularly, e.g. once a week. The checks cover whether the logging script is running, whether data arrive from the sonic anemometer and each gas analyzer, whether the newest file is growing, whether there are files for each of the last 7 days, and how much disk space is left.
