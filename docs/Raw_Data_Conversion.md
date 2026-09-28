---
title: "Raw data conversion"
---

[bico](scripts/bico.md) converts the binary raw data files from sonicread to CSV files that EddyPro can read.

- **Boxes:** 3 and 16 in the [processing chain](Processing_Chain.md).
- **Input:** binary raw data files from [sonicread](scripts/sonicread.md), 20 Hz.
- **Output:** one CSV file per raw data file, with a 3-row header, optionally compressed (`.gz`).
- **Runs on:** your own computer.
- **Next step:** [Level-0 run](Level0_Run.md).

Raw data files from [rECord](scripts/rECord.md) are already CSV files and skip this step.
