---
title: "Flux product"
---

The result of the processing chain: fluxes, meteo data and management data.

- **Box:** 14 in the [processing chain](Processing_Chain.md).
- **Fluxes:** from the [flux processing chain](Flux_Processing_Chain.md).
- **Meteo data:** from the [additional meteo for dataset](Meteo_For_Dataset.md).
- **Management data:** from the [management data](Management_Data.md), if relevant.
- **Timestamps:** `TIMESTAMP_MIDDLE`, CET. See [Conventions](Conventions.md).

## Variables to include

Variables widely used in ecosystem research, if available:

- **Fluxes:** NEE, GPP, RECO, LE, H, with flags that separate measured from gap-filled values.
- **Meteo:** `TA`, `SW_IN`, `SW_OUT`, `LW_IN`, `LW_OUT`, `PPFD`, `RH`, `PA`, `PREC`, `SWC`, `TS`, `VPD`.
- **Energy balance closure:** `G` and `NETRAD`.

## Sharing with FLUXNET

- **Which fluxes:** the L1 fluxes. FLUXNET runs its own outlier removal, USTAR filtering, gap-filling and partitioning.
- **Clearly wrong data:** set to `-9999` before the upload, e.g. fluxes from a defective sensor or periods with low signal strength ("soft QC").
- **FLUXNET levels:** FLUXNET calls the uploaded data Level-2.
- **Source file:** the EddyPro `*_fluxnet_*` file, adjusted. It cannot be uploaded as it is.
- **File format:** CSV, one file per year, 30 min, missing values `-9999`.
- **Timestamps:** `TIMESTAMP_START` and `TIMESTAMP_END`, `YYYYMMDDhhmm`, local standard time.
- **Variable names:** FLUXNET codes with a position suffix, e.g. `FC_1_1_1`.
- **Metadata:** site ID (`CC-SSS`), latitude and longitude (WGS 84, at least 4 decimals), time zone, height of the gas analyzer.
- **Meteo data:** from the meteo files, not from the EddyPro output. See [Meteo for EddyPro](Meteo_For_EddyPro.md).
- **BADM files:** metadata about the site and the variables go with the upload.
- **Upload:** one file per year, then check the submitted files.

*To be written.*
