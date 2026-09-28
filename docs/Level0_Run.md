---
title: "Level-0 run"
---

[fluxrun](scripts/fluxrun.md) runs EddyPro on the raw data files. The Level-0 run gives preliminary fluxes.

- **Boxes:** 4 and 5 in the [processing chain](Processing_Chain.md).
- **Input:** raw data CSV files from [bico](Raw_Data_Conversion.md) or [rECord](Raw_Data_Logging.md), compressed (`.gz`) or not.
- **Settings:** an EddyPro settings file (`.eddypro`) with a `.metadata` file of the same name next to it.
- **Output:** preliminary fluxes.
- **Runs on:** your own computer.
- **Next step:** [Level-1 run](Level1_Run.md).

The preliminary fluxes are used to refine the settings for the Level-1 run, e.g. the time lag.

*To be written.*
