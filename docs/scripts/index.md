---
title: "Scripts"
tbl-colwidths: [15, 50, 35]
---

::: {.callout-note title="Summary"}
Six scripts carry the data from the site to the flux product: two logging scripts on site ([sonicread](sonicread.md) and [rECord](rECord.md)), [bico](bico.md) for the conversion, [fluxrun](fluxrun.md) for the flux calculation, [dataflow](dataflow.md) for the meteo upload and [diive](diive.md) for the post-processing. The table gives the task and the repository of each script.
:::

| Script | Task | Repository |
|---|---|---|
| [sonicread](sonicread.md) | logs eddy covariance raw data on site as binary files | no repository |
| [rECord](rECord.md) | logs eddy covariance raw data on site as CSV files | not public |
| [bico](bico.md) | converts the binary files from [sonicread](sonicread.md) to CSV files | [github.com/holukas/bico](https://github.com/holukas/bico) |
| [fluxrun](fluxrun.md) | runs EddyPro on the raw data CSV files | [github.com/holukas/fluxrun](https://github.com/holukas/fluxrun) |
| [dataflow](dataflow.md) | uploads meteo logger files to the database | [github.com/holukas/dataflow](https://github.com/holukas/dataflow) |
| [diive](diive.md) | screens meteo data and runs the flux post-processing chain | [github.com/holukas/diive](https://github.com/holukas/diive) |
