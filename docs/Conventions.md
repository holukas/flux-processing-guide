---
title: "Conventions"
---

Timestamps, variable names and data versions used in all steps.

## Timestamps

- **Local time:** CET (UTC+1), all year, without daylight saving time.
- **Database:** timestamps mark the end of the averaging period (`TIMESTAMP_END`), stored in UTC. Data are converted to UTC on upload and back to CET on download.
- **EddyPro output:** `TIMESTAMP_END`.
- **diive:** works internally with the middle of the period (`TIMESTAMP_MIDDLE`).
- **Flux products:** `TIMESTAMP_MIDDLE`, CET. `09:15` covers 09:00 to 09:30. With end timestamps, a daily sum would count the record ending at midnight to the next day.
- **FLUXNET upload:** `TIMESTAMP_START` and `TIMESTAMP_END`, format `YYYYMMDDhhmm`, local standard time.

## Variable names

Meteo variables are named `VAR_H_V_R`:

| Part | Meaning | Examples |
|---|---|---|
| `VAR` | variable, mostly FLUXNET codes | `TA`, `SWC`, `TS` |
| `H` | horizontal position | `T1` tower, `M1` mast, `GF1` grassland floor, `FF1` forest floor |
| `V` | height, or depth in the soil, in metres | `35`, `1.5`, `0.10` |
| `R` | replicate at the same position | `1`, `2` |

- **Examples:** `TA_T1_35_1`, `SWC_FF1_0.10_1`, `TS_GF2_0.50_1`.
- **Read the position from the end** of the name, because some names carry extra parts.
- **Campbell loggers** do not allow `.` in names and use `x` instead, e.g. `0x02`.
- **No special characters** such as umlauts in variable, site, file or folder names.
- **Sites:** `CC-SSS`, e.g. `CH-DAV`.
- **Other formats:** FLUXNET and EddyPro use numbers for the position, e.g. `TA_1_1_1`. diive renames the variables for them, see [Biomet data](data/Biomet_Data.md).

Source: [Swiss FluxNet naming convention](https://www.swissfluxnet.ethz.ch/index.php/data/variables/naming-convention/)

## Data versions

Each variable in the database carries a data version:

| Data version | Content |
|---|---|
| `raw` | raw meteo data, uploaded by [dataflow](scripts/dataflow.md) |
| `meteoscreening_diive` | screened meteo data, 30 min, from the [meteo screening](Meteo_Screening.md) |
| `meteoscreening_mst` | older screened meteo data, from the earlier MeteoScreeningTool |
| `eddypro_level-0` | L0 fluxes from EddyPro, preliminary |

## Missing values

- **Files for EddyPro and FLUXNET:** `-9999`.
- **rECord raw data files:** `"NAN"`.
- **Database and diive:** empty values (`NaN`), no code.
