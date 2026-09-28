---
title: "Management data"
---

Field records of the management at the site.

- **Box:** 15 in the [processing chain](index.md).
- **Next step:** [flux post-processing chain](Flux_Post_Processing_Chain.md) and [flux product](Flux_Product.md).

## Where the data go

- **L3.2** (outlier flagging) in the flux post-processing chain.
- **L4.1** (gap-filling) in the flux post-processing chain.
- **Flux product,** if relevant.

## From field records to a time series

The flux post-processing chain needs the management as a time series, e.g. for the random forest gap-filling in [L4.1](L4.1.md).

1. **List the events:** give each kind of event a variable name, e.g. `MGMT_MOWING`, `MGMT_FERT_ORG`, `MGMT_GRAZING`. Group similar events.
2. **Daily time series:** one column per event, `1` on days with the event, `0` otherwise. Whole days, because exact start and end times are often missing.
3. **Time since the event:** for each event, count the time since its last occurrence, e.g. `TIMESINCE_MGMT_MOWING`. This puts each record in relation to past events.
4. **Half-hourly:** convert the daily data to 30 min, with `TIMESTAMP_MIDDLE`.
5. **Several fields:** if the footprint covers fields with different management, use the wind direction to pick the field the wind comes from, e.g. `_FOOTPRINT` variables.

*To be written.*
