---
title: "Meteo screening"
---

::: {.callout-note title="Summary"}
A [diive](scripts/diive.md) notebook screens each meteo variable from the raw bucket with outlier tests and corrections, and resamples it to 30 min. The screened data are uploaded to the processed bucket with the data version `meteoscreening_diive`.
:::

The raw data reach the database with [dataflow](scripts/dataflow.md).

- **Boxes:** 11 and 12 in the [processing chain](index.md).
- **Notebook:** `DatabaseInfluxStepwiseMeteoScreening.ipynb`, one variable at a time.
- **Runs on:** a local installation, on demand. The notebook needs the `configs` and `configs_secret` folders.
- **Next step:** [meteo for EddyPro](Meteo_For_EddyPro.md) and [additional meteo for dataset](Meteo_For_Dataset.md).

## Steps

1. The variable is downloaded from the raw bucket, in local time.
2. The data are plotted. Without obvious outliers, the corrections or the resampling come next.
3. The outlier tests the variable needs run one at a time. Each test shows a preview; `addflag()` keeps its flag.
4. The flags are combined into the overall flag QCF.
5. Corrections are applied, if needed.
6. Optional: the radiation data are correlated with potential radiation, day by day, to find time shifts.
7. The data are resampled to 30 min.
8. The data are uploaded to the processed bucket, then downloaded again to check them.

## Outlier tests

Each test flags a record with `0` (ok) or `2` (outlier). Some tests can run separately for day and night; day and night follow from the site coordinates.

| Test | Flags |
|---|---|
| Manual removal | single timestamps or date ranges, given in local time |
| Hampel filter | spikes far from the median in a moving window |
| z-score | values far from the mean of the whole period |
| Rolling z-score | values far from the mean in a moving window |
| Local SD | values far from the median in a moving window, in standard deviations |
| Increments z-score | unusual jumps between neighbouring records |
| Local outlier factor | a set fraction of the records; slow on high-resolution data |
| Absolute limits | values outside a minimum and maximum |
| Trim low | values below a limit, and the same number of the highest values |
| Missing values | missing records, so that they count in QCF |

When the resolution of the data changes, e.g. from 10 min to 1 min, the moving-window tests run on each period separately.

## Overall flag QCF

- Combines the test flags: `0` good, `1` marginal, `2` bad. See [QCF](QCF.md).
- Records with QCF `2` are removed before the resampling.

## Corrections

- **Radiation offset** (`SW_IN`, `PPFD`): subtracts each day's mean nighttime value, then sets nighttime values to 0.
- **Relative humidity above 100 %:** subtracts the daily offset above 100 %, then caps the remaining values at 100 %.
- **Other:** values beyond a threshold set to the threshold, date ranges set to a constant, or a fixed value removed, e.g. a stuck reading.

## Resampling

- **Target:** 30 min, with `TIMESTAMP_END`.
- **Aggregation:** time-weighted mean, or sum for variables that add up over the interval, e.g. precipitation.
- **Minimum coverage:** kept records must cover a set fraction of the 30 min (the notebook uses 50 %). Otherwise the value is missing.

## Upload

- The screened data keep the variable name of the raw data, with the data version `meteoscreening_diive`.
- **Older screened data** have the data version `meteoscreening_mst`, from the deprecated MeteoScreeningTool (MST). They are not corrected for everything, so problems can remain. Both versions are merged and checked in [additional meteo for dataset](Meteo_For_Dataset.md).
- **Grafana:** the screened data also appear in the [Grafana dashboards](https://dataviews.swissfluxnet.ethz.ch), where both data versions can be shown next to each other.
- The flags stay in the notebook and are not uploaded.
- An upload replaces the screened data of the same variable and period. The raw data are not changed.

See [Conventions](Conventions.md) for timestamps and data versions.
