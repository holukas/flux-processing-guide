---
title: "EC raw data: rECord"
---

Eddy covariance raw data files written by [rECord](../scripts/rECord.md) on site.

- **Format:** CSV files in TOA5 format, 20 Hz, with a 4-row header, compressed (`.gz`) after recording.
- **No conversion needed:** the files go directly to [fluxrun](../scripts/fluxrun.md), without [bico](../scripts/bico.md).

## File name

`<SITE>_ec_<YYYYMMDD-HHMM>.csv.gz`, for example `CH-FRU_ec_20240404-1300.csv.gz`. Daily files have only the date, `YYYYMMDD`.

## File content

- **Separator:** comma.
- **Rows:** one row per sonic record, 20 Hz.
- **No timestamp column.** The time of each record follows from the file name and the 20 Hz rate.
- **Missing values:** `"NAN"`. [fluxrun](../scripts/fluxrun.md) replaces them with `-9999` before EddyPro reads the file.

## Header

| Row | Content |
|---|---|
| 1 | File info: `"TOA5"`, logger name, operating system, [rECord](../scripts/rECord.md) version |
| 2 | Variable names |
| 3 | Units |
| 4 | Instrument of each column, e.g. `[GillHS50]`, `[LI7500RS]` |

In some files, rows 3 and 4 are empty.

## Example columns

A site with a Gill R3-50 sonic and a LI-7500 gas analyzer:

| Column | Unit | Content |
|---|---|---|
| `U`, `V`, `W` | m s-1 | wind components |
| `T_SONIC` | K | sonic temperature |
| `SA_DIAG_TYPE`, `SA_DIAG_VALUE` | | sonic status |
| `CO2_CONC`, `H2O_CONC` | mmol m-3 | CO2 and H2O concentration |
| `TEMP_BOX` | degC | gas analyzer temperature |
| `PRESS_BOX` | kPa | gas analyzer pressure |
| `COOLER_V` | V | cooler voltage |
| `GA_DIAG_CODE` | | gas analyzer diagnostics |
| `AGC` | % | automatic gain control |
| `STATUS_CODE` | | [rECord](../scripts/rECord.md) status for the gas analyzer |

The column names come from the [rECord](../scripts/rECord.md) settings of each site, so they differ between sites and instruments.
