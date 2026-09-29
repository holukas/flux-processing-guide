---
title: "Flux post-processing chain"
---

[diive](scripts/diive.md) processes the EddyPro output in levels, with the notebook `FluxPostProcessingChain.ipynb`.

- **Box:** 13 in the [processing chain](index.md).
- **Input:** the EddyPro output of the [L1 final flux run](L1.md).
- **Drivers:** screened meteo data from the [additional meteo for dataset](Meteo_For_Dataset.md), at L3.3, L4.1 and L4.2.
- **Management data:** from the [management data](Management_Data.md), at L3.2 and L4.1.
- **Runs on:** your own computer.
- **Next step:** [flux product](Flux_Product.md).

## Levels


| Level | Step |
|---|---|
| [L2](L2.md) | Quality flag expansion |
| [L3.1](L3.1.md) | Storage correction |
| [L3.2](L3.2.md) | Outlier flagging |
| [L3.3](L3.3.md) | USTAR threshold detection, on nighttime NEE that passed the checks so far |
| [L3.4](QCF.md#l3.4) | Overall quality flag QCF |
| [L4.1](L4.1.md) | Gap-filling |
| [L4.2](L4.2.md) | Partitioning (NEE and ET) |

## Levels and flags

- **Guidelines:** the chain follows established community guidelines (Aubinet et al., 2012; Sabbatini et al., 2018).
- **Flags, not deletions:** L2, L3.2 and L3.3 only create flags. No data are removed there.
- **Temporary QCF:** after L2, the L2 flags remove rejected records before the outlier tests in L3.2.
- **Final QCF:** L3.4 combines all flags. Gap-filling and partitioning use the filtered fluxes.
- **Three USTAR scenarios** give three versions of NEE, N2O and CH4. See [L3.3](L3.3.md).

*To be written.*
