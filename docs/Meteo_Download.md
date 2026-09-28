---
title: "Meteo download"
---

[diive](scripts/diive.md) notebooks download screened meteo data from the database.

- **Box:** 18 in the [processing chain](Processing_Chain.md).
- **Notebooks:** `DatabaseInfluxDownloadSpecificVars.ipynb` and `DatabaseInfluxDownloadAllVarsOfMeasurements.ipynb`.
- **Input:** screened meteo data from the processed bucket, 30 min.
- **Runs on:** your own computer. The notebooks need the `configs` and `configs_secret` folders.
- **Next step:** [flux processing chain](Flux_Processing_Chain.md) and [flux product](Flux_Product.md).

## Where the data go

- **Drivers** for the flux processing chain, at L3.3 (USTAR threshold), L4.1 (gap-filling) and L4.2 (partitioning).
- **Flux product:** the meteo data go into it.

## Corrections on the 30-min data

Some data need corrections that can only be made on the 30-min data, after the [meteo screening](Meteo_Screening.md). Problems that span years, sensors or data sources, or that need a reference series at 30 min, show up in the merged 30-min record. These corrections follow when the data are downloaded:

- **Merge sources:** e.g. data screened with the current method first, older screened data to fill the remaining gaps.
- **Logger clock errors:** a shifted block of timestamps. Check the daily cycle in a heatmap: after the correction, e.g. the warmest hours have to be around midday again. A clock error affects every variable of that logger.
- **Damaged periods:** compare with a reference sensor, e.g. on the same tower or at a nearby station, day by day. Periods that cannot be repaired are removed and then gap-filled.
- **Sensor or logger changes:** a replaced sensor can make the series step at the changeover. A reference series that spans the change shows the step and gives the correction. Keep the measured series and add a homogenized one.
- **Gap-filling per period:** do not train a gap-filling model across a sensor change.
- **Flags:** mark filled values, e.g. `FLAG_<variable>_ISFILLED`, and the source of each value, e.g. `FLAG_<variable>_SOURCE`.
- **Resolution check:** make sure the data are really 30 min.

## Preparing the drivers

- **Gap-filling:** drivers need complete time series, e.g. gap-filled with XGBoost in diive, with lagged variants as additional features.
- **VPD:** calculated from gap-filled `TA` and `RH`.
- **Lagged variants:** e.g. the mean over the preceding 3 hours (`MEAN3H`), and that mean shifted back in steps of 3 hours.
- **Time since precipitation:** the number of records since the last precipitation event.
- **Sensor changes:** when sensors or depths changed without overlap, merge the most similar series.

*To be written.*
