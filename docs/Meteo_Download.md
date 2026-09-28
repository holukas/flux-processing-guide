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

## Preparing the drivers

- **Gap-filling:** drivers need complete time series, e.g. gap-filled with XGBoost in diive, with lagged variants as additional features.
- **VPD:** calculated from gap-filled `TA` and `RH`.
- **Lagged variants:** e.g. the mean over the preceding 3 hours (`MEAN3H`), and that mean shifted back in steps of 3 hours.
- **Time since precipitation:** the number of records since the last precipitation event.
- **Sensor changes:** when sensors or depths changed without overlap, merge the most similar series.

*To be written.*
