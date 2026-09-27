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

## Tools

- **bico** converts the binary raw data written by sonicread to ASCII files for EddyPro.
- **fluxrun** runs EddyPro on the raw data files, converted by bico or written directly by rECord.
- **EddyPro** calculates the fluxes from the high-resolution raw data.
- **dataflow** finds logger files, assigns a filetype and uploads the data to the database.
- **diive** screens the meteo data and runs the flux processing chain.
