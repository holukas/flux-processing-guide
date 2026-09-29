---
title: "dataflow"
---

::: {.callout-note title="Summary"}
dataflow uploads meteo logger files to the InfluxDB database automatically, as a command line script on the database server. dataflow reads each file with the settings of its filetype.
:::

- **Steps:** scans folders for files, assigns a filetype to each file it recognizes, reads the variables in the file and uploads the data.
- **Filetypes:** each filetype is defined in a configuration file.
- **Database access:** the connection settings are kept separate from the configuration files, for security.
- **Runs on:** the database server, automatically. It is never run by hand.

Source code: [github.com/holukas/dataflow](https://github.com/holukas/dataflow)
