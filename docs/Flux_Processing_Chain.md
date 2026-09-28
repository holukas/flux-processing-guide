---
title: "Flux processing chain"
---

diive processes the EddyPro output in levels, with the notebook `FluxProcessingChain.ipynb`.

- **Box:** 13 in the [processing chain](Processing_Chain.md).
- **Input:** the EddyPro output of the [Level-1 run](Level1_Run.md).
- **Drivers:** screened meteo data from the [meteo download](Meteo_Download.md), at L3.3, L4.1 and L4.2.
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
| [L3.4](L3.4.md) | Overall quality flag QCF |
| [L4.1](L4.1.md) | Gap-filling |
| [L4.2](L4.2.md) | Partitioning (NEE and ET) |

*To be written.*
