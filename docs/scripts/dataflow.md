---
title: "dataflow"
---

::: {.callout-note title="Summary"}
dataflow uploads meteo logger files to the InfluxDB database, as a command line script on the database server. A filetype for each kind of file tells dataflow how to read that kind of file.
:::

- **Steps:** scans folders for files, assigns a filetype to each file it recognizes, reads the variables in it and uploads the data.
- **Filetypes:** each filetype is defined in a configuration file, which tells dataflow how to read that kind of file.
- **Database access:** the connection settings are kept separate from the configuration files, for security.
- **Runs on:** the database server.

Source code: [github.com/holukas/dataflow](https://github.com/holukas/dataflow)
