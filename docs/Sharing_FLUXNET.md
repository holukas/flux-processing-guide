---
title: "Sharing with FLUXNET"
---

::: {.callout-note title="Summary"}
The L1 fluxes and the meteo data are uploaded to FLUXNET through the European Fluxes Database Cluster (EFDC), with metadata in BADM files. FLUXNET then runs the outlier removal, USTAR filtering, gap-filling and partitioning with its own scripts.
:::

## Upload content

- **L1 fluxes:** not outlier-removed, not USTAR-filtered, not gap-filled, not partitioned. FLUXNET does these steps with its own scripts. See [L1](L1.md).
- **Clearly wrong data:** set to `-9999` before the upload, e.g. fluxes from a defective sensor that still produced data, or periods with low signal strength ("soft QC").
- **Flux variables:** from the EddyPro output, renamed to FLUXNET codes. Only the most relevant variables, not all of them.
- **The EddyPro `*_fluxnet_*` file** cannot be uploaded as it is, despite its name. For older years, that file has [empty SSITC flags](L1.md#known-issues).
- **Meteo data:** from the meteo files, not from the EddyPro output, which has meteo values only where fluxes were calculated. See [Meteo for EddyPro](Meteo_For_EddyPro.md).
- **BADM files:** metadata about the site and the variables go with the upload.

FLUXNET calls the uploaded data Level-2: original data from the PI, checked or filtered only for out-of-range values or clearly wrong data. FLUXNET Level-2 is the L1 of this guide.

## Metadata

| Item | Example |
|---|---|
| Site ID, `CC-SSS`: two-letter country code, three-letter site code | `CH-Dav` |
| Latitude and longitude, WGS 84, at least 4 decimals | `42.5378` / `-72.1715` |
| Time zone of the site, as a time series if it changed | `UTC-5` |
| Height of the gas analyzer | `30.0 m` |

## File format

| Item | Value |
|---|---|
| File type | CSV, variable codes in the first line |
| Missing values | `-9999` |
| Timestamps | `TIMESTAMP_START` and `TIMESTAMP_END`, format `YYYYMMDDhhmm` |
| Time | local standard time, no daylight saving time |
| Time resolution | 30 min (60 min is also accepted) |
| Files | one file per year |
| Variable names | FLUXNET codes with a position suffix, e.g. `FC_1_1_1`, `TS_1_2_1` |

For 2020, e.g.:

| | First | Last |
|---|---|---|
| `TIMESTAMP_START` | `202001010000` | `202012312330` |
| `TIMESTAMP_END` | `202001010030` | `202101010000` |

## Flux variables

| Variable | Unit | Description |
|---|---|---|
| `FC` | µmol CO2 m-2 s-1 | CO2 turbulent flux, without storage |
| `FC_SSITC_TEST` | – | quality flag of FC |
| `SC` | µmol CO2 m-2 s-1 | CO2 storage flux from a vertical profile; optional if the tower is shorter than 3 m |
| `CO2` | µmol CO2 mol-1 | CO2 mole fraction in moist air |
| `LE` | W m-2 | latent heat turbulent flux, without storage |
| `LE_SSITC_TEST` | – | quality flag of LE |
| `SLE` | W m-2 | latent heat storage below the measurement height |
| `H2O` | mmol H2O mol-1 | H2O mole fraction |
| `H` | W m-2 | sensible heat turbulent flux, without storage |
| `H_SSITC_TEST` | – | quality flag of H |
| `SH` | W m-2 | heat storage in the air below the measurement height |
| `USTAR` | m s-1 | friction velocity |
| `WD` | ° | wind direction |
| `WS` | m s-1 | horizontal wind speed |
| `FETCH_70` | m | fetch at which the cumulative footprint reaches 70 % |
| `FETCH_90` | m | fetch at which the cumulative footprint reaches 90 % |
| `FETCH_MAX` | m | fetch of the footprint maximum |

## Meteo variables

| Variable | Unit | Description |
|---|---|---|
| `G` | W m-2 | ground heat flux, for the energy balance closure |
| `NETRAD` | W m-2 | net radiation, for the energy balance closure |
| `SW_IN`, `SW_OUT` | W m-2 | incoming and outgoing shortwave radiation |
| `LW_IN`, `LW_OUT` | W m-2 | incoming and outgoing longwave radiation |
| `PPFD_IN`, `PPFD_OUT` | µmol photons m-2 s-1 | incoming and outgoing photosynthetic photon flux density |
| `TA` | °C | air temperature |
| `RH` | % | relative humidity, 0 to 100 |
| `PA` | kPa | atmospheric pressure |
| `P` | mm | precipitation total per 30 or 60 min |
| `SWC` | % | volumetric soil water content, 0 to 100 |
| `TS` | °C | soil temperature |

## Upload

- Each yearly file is uploaded separately.
- Some information about the data is added.
- The submitted files are checked after all years are uploaded.

## Processing at FLUXNET

1. **Level-3:**
   - NEE from the storage correction (Papale et al., 2006).
   - More quality flags and checks: spikes, and USTAR filtering flags for low turbulence, which add gaps.
2. **Level-4:**
   - Quality flags applied, e.g. spike removal (Papale et al., 2006).
   - Gap-filling.
   - Partitioning of NEE into gross primary production (GPP) and ecosystem respiration.
   - Aggregation to other time resolutions.

*To be written.*
