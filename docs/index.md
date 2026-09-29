---
title: "Flux Processing Guide"
---

From raw eddy covariance and meteo data to quality-controlled fluxes and the flux product. Numbers in brackets refer to the boxes in the chart.

<!-- Inline, not as an image, so the chart follows the site's light/dark toggle. -->
```{=html}
<div class="chain-chart" data-src="images/processing-chain.svg">
{{< include images/processing-chain.svg >}}
</div>
```

## Time resolution

The pills at the bottom of the boxes show the time resolution of the data.

- **Eddy covariance raw data:** 20 Hz. The fluxes calculated from them are 30 min, from L0 on.
- **Meteo data:** high resolution in the logger files, the upload and the raw bucket: mostly 1 min, sometimes 10 s or 30 min.
- **From the meteo screening on:** 30 min. The screening resamples the data.

## Eddy covariance

- **[Raw data logging](Raw_Data_Logging.md) (1, 2):** a logger on site records the raw data at 20 Hz.
  - [sonicread](scripts/sonicread.md) writes binary files (1). Format: [EC raw data: sonicread](data/Raw_Data_EC.md).
  - [rECord](scripts/rECord.md) writes CSV files in TOA5 format (2). Format: [EC raw data: rECord](data/Raw_Data_EC_rECord.md).
- **[Raw data conversion](Raw_Data_Logging.md#conversion) (3, 16):** [bico](scripts/bico.md) converts the binary files from [sonicread](scripts/sonicread.md) to CSV files.
  - Files from [rECord](scripts/rECord.md) are already CSV files and skip this step.
- **[L0 · Preliminary run](L0.md) (4, 5):** [fluxrun](scripts/fluxrun.md) runs EddyPro on the raw CSV files, with relaxed settings and a wide time lag window.
  - The preliminary fluxes are used for checks: complete data, plausible fluxes, time lags, wind direction.
  - They are used to refine the settings for L1, e.g. the time lag.
- **[L1 · Final flux run](L1.md) (6, 7):** the final [fluxrun](scripts/fluxrun.md) run, with the refined settings, on the same raw data.
  - It also uses 6 meteo variables as input (17).
  - The result is the EddyPro output, 30 min. All later steps use it.

## Meteo

- **[Meteo logging](Meteo_Logging.md) (8):** meteo stations on site record the meteo data.
- **[Meteo upload](Meteo_Logging.md#upload) (9, 10):** [dataflow](scripts/dataflow.md) uploads the logger files to the raw bucket of the InfluxDB database.
- **[Meteo screening](Meteo_Screening.md) (11, 12):** a [diive](scripts/diive.md) notebook screens the meteo data, resamples them to 30 min and uploads them to the processed bucket.
- **[Meteo for EddyPro](Meteo_For_EddyPro.md) (17):** a [diive](scripts/diive.md) notebook formats 6 screened meteo variables for the L1 run.
- **[Additional meteo for dataset](Meteo_For_Dataset.md) (18):** [diive](scripts/diive.md) notebooks merge the screened meteo data from both screening tools, correct them on the 30-min data and write them for the dataset.
  - They are drivers for the [diive](scripts/diive.md) flux post-processing chain.
  - They also go into the flux product.

## Management

- **[Management data](Management_Data.md) (15):** field records.
  - Used at L3.2 (outlier flagging) and L4.1 (gap-filling).
  - Go into the flux product, if relevant.

## Flux processing

- **[Flux post-processing chain](Flux_Post_Processing_Chain.md) (13):** the notebook `FluxPostProcessingChain.ipynb` processes the L1 fluxes from L2 to L4.2.
  - Meteo drivers are used at L3.3 (USTAR threshold), L4.1 (gap-filling) and L4.2 (partitioning).
- **[Flux product](Flux_Product.md) (14):** fluxes, meteo data and management data.

## Scripts

- **[sonicread](scripts/sonicread.md)** logs eddy covariance raw data on site as binary files.
- **[rECord](scripts/rECord.md)** logs eddy covariance raw data on site as CSV files.
- **[bico](scripts/bico.md)** converts the binary raw data written by [sonicread](scripts/sonicread.md) to CSV files for EddyPro.
- **[fluxrun](scripts/fluxrun.md)** runs EddyPro on the raw data files, converted by [bico](scripts/bico.md) or written directly by [rECord](scripts/rECord.md).
- **[dataflow](scripts/dataflow.md)** finds logger files, assigns a filetype and uploads the data to the database.
- **[diive](scripts/diive.md)** screens the meteo data and runs the flux post-processing chain.
