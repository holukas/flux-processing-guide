---
title: "dataflow"
---

dataflow uploads meteo logger files to the InfluxDB database. It runs as a command line script on the server that hosts the database.

- **What it does:** scans folders for files, assigns a filetype to each file it recognizes, reads the variables in it and uploads the data.
- **Filetypes:** each filetype is defined in a configuration file, which tells dataflow how to read that kind of file.
- **Database access:** the connection settings are kept separate from the configuration files, for security.
- **Runs on:** the database server.

Source code: [github.com/holukas/dataflow](https://github.com/holukas/dataflow)
