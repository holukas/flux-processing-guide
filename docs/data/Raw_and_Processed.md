---
title: "Raw and processed data"
---

## Raw data

Raw data are files that are generated directly by sensors and loggers. These files are copied from the site to a central storage, where they are sorted into their destination folders.

## Processed data

Raw data are used to generate processed data. Every time raw data are changed in any way, they become processed data.

Some examples:

- When air temperature has a lot of gaps in its time series and is therefore gap-filled, the gap-filled time series is processed data.
- Data from the sonic anemometers and gas analyzers (raw data) are used to calculate eddy covariance fluxes (processed data).

In this guide, the eddy covariance raw data are described in [EC raw data: sonicread](Raw_Data_EC.md) and [EC raw data: rECord](Raw_Data_EC_rECord.md). The meteo data are kept in the database in a raw bucket and, after screening, in a processed bucket.
