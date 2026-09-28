---
title: "Meteo upload"
---

[dataflow](scripts/dataflow.md) uploads the meteo logger files to the raw bucket of the InfluxDB database.

- **Boxes:** 9 and 10 in the [processing chain](Processing_Chain.md).
- **Input:** logger files from [meteo logging](Meteo_Logging.md).
- **Output:** the raw meteo data in the raw bucket, data version `raw`, in the time resolution of the logger files.
- **Runs on:** the database server.
- **Next step:** [meteo screening](Meteo_Screening.md).

## Details

- **Filetypes:** dataflow assigns a filetype to each file it recognizes. The filetype tells dataflow how to read the file.
- **Timestamps:** converted to UTC on upload. See [Conventions](Conventions.md).
