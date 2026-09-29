---
title: "Meteo for EddyPro"
---

::: {.callout-note title="Summary"}
A [diive](scripts/diive.md) notebook writes 6 screened meteo variables (`SW_IN`, `LW_IN`, `PPFD`, `RH`, `TA`, `PA`) to a CSV file for the [L1 final flux run](L1.md). EddyPro calls them biomet data and uses them to improve the flux calculation and corrections.
:::

- **Box:** 17 in the [processing chain](index.md).
- **Notebook:** `FormatMeteoForEddyProFluxProcessing.ipynb`.
- **Input:** screened meteo data from the processed bucket, 30 min.
- **Variables:** `SW_IN`, `LW_IN`, `PPFD`, `RH`, `TA`, `PA`. See [the 6 variables](#variables).
- **Runs on:** a local installation, on demand. The notebook needs the `configs` and `configs_secret` folders.
- **Next step:** [L1 final flux run](L1.md).

## Biomet data: the 6 variables {#variables}

The L1 final flux run of [fluxrun](scripts/fluxrun.md) gives EddyPro the 6 meteo variables as input.

| Variable | Name in EddyPro | Units EddyPro accepts |
|---|---|---|
| Global radiation (`SW_IN`) | `Rg` | W m-2, J s-1 m-2 |
| Long-wave incoming radiation (`LW_IN`) | `Lwin` | W m-2, J s-1 m-2 |
| Photosynthetic photon flux density (`PPFD` or `PAR`) | `PPFD` | µmol m-2 s-1, µE m-2 s-1 |
| Relative humidity (`RH`) | `RH` | % |
| Air temperature (`TA`) | `Ta` | K, C, cC, F, cF, cK |
| Atmospheric pressure (`PA`) | `Pa` | Pa, hPa, kPa, PSI, Torr, mmHg, Atm, Bar |

## Use in EddyPro {#uses}

- **`SW_IN` and `LW_IN`:** the "multiple regression" version of the off-season uptake correction (Burba et al., 2008).
- **`PPFD`:** day and night radiation load on the instrument surface. The off-season uptake correction uses it to pick its coefficients and to model the instrument surface temperature.
- **`RH`, `TA` and `PA`:** replace the mean values that EddyPro would otherwise estimate from the eddy covariance data or from the site characteristics.
- **`TA`:** also used, for example, in the WPL correction for IRGA75.

Source: EddyPro v7.0 manual.

## Corrections first

The 6 variables need the same corrections on the 30-min data as the [additional meteo for dataset](Meteo_For_Dataset.md#corrections-on-the-30-min-data), e.g. for logger clock errors or sensor changes, before they go to EddyPro.

## The meteo file

A CSV file with two header rows, variable names and units, e.g.:

```
date,time,Lwin_1_1_1,PPFD_1_1_1,RH_1_1_1,Rg_1_1_1,Ta_1_1_1,Pa_1_1_1
yyyy-mm-dd,HH:MM,W+1m-2,umol+1m-2s-1,%,W+1m-2,C,kPa
2020-01-01,00:30,309.09,0.019,100,3.56,-0.10,98.64
```

- **Quality-controlled:** all 6 variables come from the [meteo screening](Meteo_Screening.md).
- **All 6 columns:** a column stays in the file even if the variable is missing completely, filled with `-9999`.
- **Missing values:** `-9999` (or `-9999.0`).
- **Timestamp:** date and time without seconds.
- **Units:** checked, especially for `PA` (Pa, hPa or kPa). See [the 6 variables](#variables) for the units EddyPro accepts.
- **Names:** EddyPro names, e.g. `Rg` for `SW_IN`, because the EddyPro interface only offers global radiation.
- **Text editor:** the file is checked in a text editor. Excel can change the format when it opens the file.
- **Extending a file:** a file from previous years can be extended with the new data.

## Import check in EddyPro

- With a wrong format, EddyPro does not stop. It ignores the file and uses its own estimates instead, with no clear warning.
- The [fluxrun](scripts/fluxrun.md) log shows the line `1 biomet record(s) imported.` once per half-hour.

## Notes

- **Gap-filled input:** gap-filled variables, e.g. `SW_IN`, `TA` and `PPFD`, give EddyPro a complete meteo input.
- **Missing variables:** without data for a variable, e.g. `RH`, EddyPro estimates it from the eddy covariance data or the site characteristics. See [use in EddyPro](#uses).
- **Missing PA:** with `PA` set to `-9999`, EddyPro calculates a constant pressure from the site altitude. Pressure measured in the IRGA box is an alternative that varies over the year. In one test, the two options gave minor differences in the cumulative CO2 and H2O fluxes.
- **Meteo in the EddyPro output:** EddyPro writes the meteo variables only for records with flux results. Meteo data for sharing, e.g. with FLUXNET, are not taken from the EddyPro output.

*To be written.*
