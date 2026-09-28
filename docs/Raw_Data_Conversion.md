---
title: "Raw data conversion"
---

[bico](scripts/bico.md) converts the binary raw data files from sonicread to CSV files that EddyPro can read.

- **Boxes:** 3 and 16 in the [processing chain](Processing_Chain.md).
- **Input:** binary raw data files from [sonicread](scripts/sonicread.md), 20 Hz.
- **Output:** one CSV file per raw data file, with a 3-row header, optionally compressed (`.gz`).
- **Runs on:** your own computer.
- **Next step:** [L0 preliminary run](L0.md).

Raw data files from [rECord](scripts/rECord.md) are already CSV files and skip this step.

- **Why:** EddyPro needs a regular format, where every row has the same number of values. The binary files from sonicread are irregular.
- **After the conversion:** the files are human-readable.
