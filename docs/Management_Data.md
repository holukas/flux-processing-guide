---
title: "Management data"
---

::: {.callout-note title="Summary"}
Field records of the site management are turned into 30-min time series of the events and of the time since each event, which go into the flux product, if relevant. The series have been used for gap-filling with tree-based models in L4.1, and in L3.2 so far only to find the management dates and check whether outlier removal around them made sense.
:::

- **Box:** 15 in the [processing chain](index.md).
- **Next step:** [flux post-processing chain](Flux_Post_Processing_Chain.md) and [flux product](Flux_Product.md).

## Use of the data

- **[L4.1](L4.1.md)** (gap-filling): used in the past as features for tree-based models, e.g. random forest.
- **[L3.2](L3.2.md)** (outlier flagging): meant to be used here. So far, only to find where management took place and whether outlier removal around those dates made sense.
- **Flux product,** if relevant.

## From field records to a time series

Tree-based gap-filling models in [L4.1](L4.1.md) need the management as a time series.

1. **Events:** each kind of event gets a variable name, e.g. `MGMT_MOWING`, `MGMT_FERT_ORG`, `MGMT_GRAZING`. Similar events are grouped.
2. **Daily time series:** one column per event, `1` on days with the event, `0` otherwise. Whole days, because exact start and end times are often missing.
3. **Time since the event:** for each event, the time since its last occurrence is counted, e.g. `TIMESINCE_MGMT_MOWING`. This puts each record in relation to past events.
4. **Half-hourly:** convert the daily data to 30 min, with `TIMESTAMP_MIDDLE`.
5. **Several fields:** if the footprint covers fields with different management, the wind direction is used to pick the field the wind comes from, e.g. `_FOOTPRINT` variables.

*To be written.*
