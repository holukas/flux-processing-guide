---
title: "Management data"
---

::: {.callout-note title="Summary"}
Field records of the site management are turned into 30-min time series of the events and of the time since each event. These series are used at L3.2 (outlier flagging) and L4.1 (gap-filling), and go into the flux product, if relevant.
:::

- **Box:** 15 in the [processing chain](index.md).
- **Next step:** [flux post-processing chain](Flux_Post_Processing_Chain.md) and [flux product](Flux_Product.md).

## Use of the data

- **L3.2** (outlier flagging) in the flux post-processing chain.
- **L4.1** (gap-filling) in the flux post-processing chain.
- **Flux product,** if relevant.

## From field records to a time series

The flux post-processing chain needs the management as a time series, e.g. for the random forest gap-filling in [L4.1](L4.1.md).

1. **Events:** each kind of event gets a variable name, e.g. `MGMT_MOWING`, `MGMT_FERT_ORG`, `MGMT_GRAZING`. Similar events are grouped.
2. **Daily time series:** one column per event, `1` on days with the event, `0` otherwise. Whole days, because exact start and end times are often missing.
3. **Time since the event:** for each event, the time since its last occurrence is counted, e.g. `TIMESINCE_MGMT_MOWING`. This puts each record in relation to past events.
4. **Half-hourly:** convert the daily data to 30 min, with `TIMESTAMP_MIDDLE`.
5. **Several fields:** if the footprint covers fields with different management, the wind direction is used to pick the field the wind comes from, e.g. `_FOOTPRINT` variables.

*To be written.*
