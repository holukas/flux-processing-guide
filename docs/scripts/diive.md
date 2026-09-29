---
title: "diive"
---

::: {.callout-note title="Summary"}
diive is a Python library for time series processing of eddy covariance and meteo data. In this guide, its notebooks screen the meteo data, prepare meteo data for EddyPro and the dataset, and run the flux post-processing chain.
:::

The library covers quality control, outlier detection, gap-filling and flux partitioning.

In this guide, diive is used in notebooks:

- `DatabaseInfluxStepwiseMeteoScreening.ipynb`: [meteo screening](../Meteo_Screening.md).
- `FormatMeteoForEddyProFluxProcessing.ipynb`: meteo data for the L1 final flux run ([biomet data](../Meteo_For_EddyPro.md#variables)).
- `DatabaseInfluxDownloadSpecificVars.ipynb` and `DatabaseInfluxDownloadAllVarsOfMeasurements.ipynb`: meteo data as drivers for the flux post-processing chain and for the flux product.
- `FluxPostProcessingChain.ipynb`: the [flux post-processing chain](../Flux_Post_Processing_Chain.md), from L2 to L4.2.

The notebooks that read from or write to the database need the `configs` and `configs_secret` folders.

- **Install:** `pip install diive`, with `pip install "diive[db]"` for the database notebooks.
- **Runs on:** a local installation, on demand.

Source code: [github.com/holukas/diive](https://github.com/holukas/diive) · Documentation: [diive.readthedocs.io](https://diive.readthedocs.io/)
