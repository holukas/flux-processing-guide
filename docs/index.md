---
title: "Flux Processing Guide"
---

From raw eddy covariance and meteo data to quality-controlled fluxes.

<!-- Inline, not as an image, so the chart follows the site's light/dark toggle. -->
```{=html}
<div class="chain-chart" data-src="images/processing-chain.svg">
{{< include images/processing-chain.svg >}}
</div>
```

The processing chain. Numbers refer to the boxes.

## Scripts

- **[sonicread](scripts/sonicread.md)** logs eddy covariance raw data on site as binary files.
- **[rECord](scripts/rECord.md)** logs eddy covariance raw data on site as CSV files.
- **[bico](scripts/bico.md)** converts the binary raw data written by sonicread to CSV files for EddyPro.
- **[fluxrun](scripts/fluxrun.md)** runs EddyPro on the raw data files, converted by bico or written directly by rECord.
- **[dataflow](scripts/dataflow.md)** finds logger files, assigns a filetype and uploads the data to the database.
- **[diive](scripts/diive.md)** screens the meteo data and runs the flux processing chain.
