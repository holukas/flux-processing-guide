---
title: "Meteo download"
---

[diive](scripts/diive.md) notebooks download screened meteo data from the database.

- **Box:** 18 in the [processing chain](Processing_Chain.md).
- **Notebooks:** `DatabaseInfluxDownloadSpecificVars.ipynb` and `DatabaseInfluxDownloadAllVarsOfMeasurements.ipynb`.
- **Input:** screened meteo data from the processed bucket.
- **Runs on:** your own computer. The notebooks need the `configs` and `configs_secret` folders.
- **Next step:** [flux processing chain](Flux_Processing_Chain.md) and [flux product](Flux_Product.md).

## Where the data go

- **Drivers** for the flux processing chain, at L3.3 (USTAR threshold), L4.1 (gap-filling) and L4.2 (partitioning).
- **Flux product:** the meteo data go into it.

*To be written.*
