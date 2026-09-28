---
title: "Processing chain"
---

From raw eddy covariance and meteo data to the flux product. Numbers in brackets refer to the boxes in the chart.

<!-- Inline, not as an image, so the chart follows the site's light/dark toggle. -->
```{=html}
<div class="chain-chart" data-src="images/processing-chain.svg">
{{< include images/processing-chain.svg >}}
</div>
```

## Eddy covariance

- **[Raw data logging](Raw_Data_Logging.md) (1, 2):** a logger on site records the raw data at 20 Hz.
  - [sonicread](scripts/sonicread.md) writes binary files (1). Format: [EC raw data: sonicread](data/Raw_Data_EC.md).
  - [rECord](scripts/rECord.md) writes CSV files in TOA5 format (2). Format: [EC raw data: rECord](data/Raw_Data_EC_rECord.md).
- **[Raw data conversion](Raw_Data_Conversion.md) (3, 16):** [bico](scripts/bico.md) converts the binary files from sonicread to CSV files.
  - Files from rECord are already CSV files and skip this step.
- **[L0 · Preliminary run](L0.md) (4, 5):** [fluxrun](scripts/fluxrun.md) runs EddyPro on the raw CSV files.
  - The result is preliminary fluxes.
  - They are used to refine the settings, e.g. the time lag.
- **[L1 · Final flux run](L1.md) (6, 7):** the final fluxrun run, with the refined settings, on the same raw data.
  - It also uses meteo data from the database (17).
  - The result is the EddyPro output, 30 min.

## Meteo

- **[Meteo logging](Meteo_Logging.md) (8):** meteo stations on site record the meteo data.
- **[Meteo upload](Meteo_Upload.md) (9, 10):** [dataflow](scripts/dataflow.md) uploads the logger files to the raw bucket of the InfluxDB database.
- **[Meteo screening](Meteo_Screening.md) (11, 12):** a diive notebook screens the meteo data, resamples them to 30 min and uploads them to the processed bucket.
- **[Meteo for EddyPro](Meteo_For_EddyPro.md) (17):** a diive notebook formats 6 screened meteo variables for the L1 run.
- **[Meteo download](Meteo_Download.md) (18):** diive notebooks download screened meteo data from the database.
  - They are drivers for the diive flux processing chain.
  - They also go into the flux product.

## Management

- **[Management data](Management_Data.md) (15):** field records.
  - Used at L3.2 (outlier flagging) and L4.1 (gap-filling).
  - Go into the flux product, if relevant.

## Flux processing

- **[Flux processing chain](Flux_Processing_Chain.md) (13):** the notebook `FluxProcessingChain.ipynb` processes the L1 fluxes from L2 to L4.2.
  - Meteo drivers are used at L3.3 (USTAR threshold), L4.1 (gap-filling) and L4.2 (partitioning).
- **[Flux product](Flux_Product.md) (14):** fluxes, meteo data and management data.
