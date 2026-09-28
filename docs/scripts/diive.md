---
title: "diive"
---

diive is a Python library for time series processing of eddy covariance and meteo data: quality control, outlier detection, gap-filling and flux partitioning.

In this guide, diive is used in notebooks:

- `DatabaseInfluxStepwiseMeteoScreening.ipynb`: [meteo screening](../Meteo_Screening.md).
- `FormatMeteoForEddyProFluxProcessing.ipynb`: meteo data for the L1 final flux run ([biomet data](../data/Biomet_Data.md)).
- `DatabaseInfluxDownloadSpecificVars.ipynb` and `DatabaseInfluxDownloadAllVarsOfMeasurements.ipynb`: meteo data as drivers for the flux processing chain and for the flux product.
- `FluxProcessingChain.ipynb`: the [flux processing chain](../Flux_Processing_Chain.md), from L2 to L4.2.

The notebooks that read from or write to the database need the `configs` and `configs_secret` folders.

- **Install:** `pip install diive`, with `pip install "diive[db]"` for the database notebooks.
- **Runs on:** your own computer.

Source code: [github.com/holukas/diive](https://github.com/holukas/diive) · Documentation: [diive.readthedocs.io](https://diive.readthedocs.io/)
