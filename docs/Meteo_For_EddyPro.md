---
title: "Meteo for EddyPro"
---

A [diive](scripts/diive.md) notebook formats 6 screened meteo variables for the [L1 final flux run](L1.md).

- **Box:** 17 in the [processing chain](Processing_Chain.md).
- **Notebook:** `FormatMeteoForEddyProFluxProcessing.ipynb`.
- **Input:** screened meteo data from the processed bucket.
- **Variables:** `SW_IN`, `LW_IN`, `PPFD`, `RH`, `TA`, `PA`. See [Biomet data](data/Biomet_Data.md).
- **Runs on:** your own computer. The notebook needs the `configs` and `configs_secret` folders.
- **Next step:** [L1 final flux run](L1.md).

## Notes

- **Gap-filled input:** gap-filled variables, e.g. `SW_IN`, `TA` and `PPFD`, give EddyPro a complete meteo input.
- **Missing variables:** without data for a variable, e.g. `RH`, EddyPro estimates it from the eddy covariance data or the site characteristics. See [Biomet data](data/Biomet_Data.md).
- **Meteo in the EddyPro output:** EddyPro writes the meteo variables only for records with flux results. Do not take meteo data for sharing, e.g. with FLUXNET, from the EddyPro output.

*To be written.*
