---
title: "Biomet data (6 meteo variables)"
---

The L1 final flux run of [fluxrun](../scripts/fluxrun.md) gives EddyPro 6 meteo variables as input. EddyPro calls them biomet data. They improve the flux calculation and corrections.

The meteo data come from the database after [meteo screening](../Meteo_Screening.md). The [diive](../scripts/diive.md) notebook `FormatMeteoForEddyProFluxProcessing.ipynb` formats them for EddyPro.

## The 6 variables

| Variable | Name in EddyPro | Units EddyPro accepts |
|---|---|---|
| Global radiation (`SW_IN`) | `Rg` | W m-2, J s-1 m-2 |
| Long-wave incoming radiation (`LW_IN`) | `Lwin` | W m-2, J s-1 m-2 |
| Photosynthetic photon flux density (`PPFD` or `PAR`) | `PPFD` | µmol m-2 s-1, µE m-2 s-1 |
| Relative humidity (`RH`) | `RH` | % |
| Air temperature (`TA`) | `Ta` | K, C, cC, F, cF, cK |
| Atmospheric pressure (`PA`) | `Pa` | Pa, hPa, kPa, PSI, Torr, mmHg, Atm, Bar |

## What EddyPro uses them for

- **`SW_IN` and `LW_IN`:** the "multiple regression" version of the off-season uptake correction (Burba et al., 2008).
- **`PPFD`:** day and night radiation load on the instrument surface. The off-season uptake correction uses it to pick its coefficients and to model the instrument surface temperature.
- **`RH`, `TA` and `PA`:** replace the mean values that EddyPro would otherwise estimate from the eddy covariance data or from the site characteristics.
- **`TA`:** also used, for example, in the WPL correction for IRGA75.

Source: EddyPro v7.0 manual.
