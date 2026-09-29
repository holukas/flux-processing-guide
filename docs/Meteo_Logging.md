---
title: "Meteo logging and upload"
---

::: {.callout-note title="Summary"}
Loggers at the meteo stations record the meteo data at high resolution, mostly 1 min. [dataflow](scripts/dataflow.md) uploads the logger files to the raw bucket of the InfluxDB database, with timestamps in UTC.
:::

- **Boxes:** 8 (logging), 9 and 10 (upload) in the [processing chain](index.md).
- **Next step:** [meteo screening](Meteo_Screening.md).

## Logging

- **Time resolution:** high: mostly 1 min, sometimes 10 s or 30 min.
- **Runs on:** the loggers at the site.
- **Next step:** [upload](#upload).

The files are raw data. See [Raw and processed data](data/Raw_and_Processed.md).

*To be written.*

## Upload {#upload}

- **Input:** logger files from the [logging](#logging).
- **Output:** the raw meteo data in the raw bucket, data version `raw`, in the time resolution of the logger files.
- **Runs on:** the database server, automatically.
- **Next step:** [meteo screening](Meteo_Screening.md).

### Details

- **Filetypes:** [dataflow](scripts/dataflow.md) assigns a filetype to each file it recognizes. The filetype tells [dataflow](scripts/dataflow.md) how to read the file.
- **Timestamps:** converted to UTC on upload. See [Conventions](Conventions.md).
