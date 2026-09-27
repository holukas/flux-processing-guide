---
title: "Flux processing chain"
---

diive processes the EddyPro output in levels:

| Level | Step |
|---|---|
| L2 | Quality flag expansion |
| L3.1 | Storage correction |
| L3.2 | Outlier flagging |
| L3.3 | USTAR threshold detection, on nighttime NEE that passed the checks so far |
| L3.4 | Overall quality flag QCF |
| L4.1 | Gap-filling |
| L4.2 | Partitioning (NEE and ET) |

*To be written.*
