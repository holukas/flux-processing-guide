---
title: "QCF: overall quality flag"
---

::: {.callout-note title="Summary"}
The QCF combines the flags of single quality tests into one overall flag per record: `0` best, `1` OK, `2` bad. The same logic applies to flux and meteo data, and L3.4 builds the final QCF of the fluxes.
:::

- **Same logic everywhere:** for flux and meteo data. Only the single tests differ.
- **One QCF per variable:** e.g. per flux, and for fluxes also per USTAR scenario.

## Test flags

Each single test gives a flag: `0` passed, `1` moderate quality, `2` failed.

- **Hard flags:** tests that give only `0` or `2`. The test is so important that a failed test makes the record bad, whatever the other tests say.
- **Soft flags:** tests that can give `1`. A record with one or two of them can still be OK for some analyses.

## Calculation

The test flags are added up:

| Sum of the flags | QCF |
|---|---|
| `0`: all tests passed | `0` |
| `1`: one flag of `1` | `1` |
| `2`: two flags of `1` | `1` |
| `2`: one flag of `2` | `2` |
| more than `2`, e.g. three flags of `1` | `2` |

## Values

| QCF | Quality | Meaning | Use |
|---|---|---|---|
| `0` | best | all tests passed | use |
| `1` | OK | no test gave `2`, one or two tests gave `1` | use, e.g. for budgets; reject for nighttime NEE at most sites |
| `2` | bad | at least one test gave `2`, or three or more gave `1` | always reject |

: {tbl-colwidths="[10,12,43,35]"}

## Day and night

- **NEE:** during the day, QCF `0` and `1` are kept. During the night, only QCF `0` is kept.
- **All other fluxes:** QCF `0` and `1` are kept, day and night.

## Where the QCF is built

| Step | QCF from | Used for |
|---|---|---|
| [Meteo screening](Meteo_Screening.md) | the outlier tests of the meteo data | removing records with QCF `2` before the resampling |
| [L2](L2.md) | the L2 flags | a temporary filter, so that the outlier tests in [L3.2](L3.2.md) run on data that passed L2 |
| [L3.3](L3.3.md) | the flags of L2 and L3.2 | the USTAR threshold detection, on nighttime NEE with QCF `0` |
| [L3.4](#l3.4) | the flags of L2, L3.2 and L3.3 | the final QCF: gap-filling and all later steps use the filtered fluxes |

## L3.4 · Overall quality flag QCF {#l3.4}

Combines all flags of the fluxes into the final overall quality flag QCF.

- **Box:** L3.4 in the [flux post-processing chain](Flux_Post_Processing_Chain.md) (13).
- **Input:** the test flags from [L2](L2.md), [L3.2](L3.2.md) and [L3.3](L3.3.md).
- **One QCF per flux**, and per USTAR scenario.
- **Next step:** [L4.1](L4.1.md).

### After L3.4

- **Filtered flux:** the flux with QCF `2` removed, and nighttime NEE with QCF `1` removed. The gap-filling in [L4.1](L4.1.md) uses it.
- **Highest-quality flux:** only records with QCF `0`.

*To be written.*

## Results

- **Filtered variable:** the variable with the rejected records removed, following the rules above.
- **Highest-quality variable:** only records with QCF `0`, e.g. to find sensible limits for the outlier tests, or to train a gap-filling model.
- **Report:** [diive](scripts/diive.md) applies the test flags one after the other and reports how many records each flag rejects. This shows which tests remove most data, and flags that remove nothing, e.g. an empty flag.

## Names in diive

For fluxes, e.g. for NEE and the USTAR scenario `CUT_50`:

| Variable | Name |
|---|---|
| QCF | `FLAG_L3.3_CUT_50_NEE_L3.1_QCF` |
| Filtered NEE | `NEE_L3.1_L3.3_CUT_50_QCF` |
| Highest-quality NEE | `NEE_L3.1_L3.3_CUT_50_QCF0` |

`NEE_L3.1` is the storage-corrected NEE from [L3.1](L3.1.md). The names carry `L3.3`, the last level with test flags.

*To be written.*
