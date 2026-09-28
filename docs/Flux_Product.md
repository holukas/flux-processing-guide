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

The L1 fluxes and the meteo data are also shared with FLUXNET, which runs its own processing. See [Sharing with FLUXNET](Sharing_FLUXNET.md).

*To be written.*
