---
title: "EC raw data: sonicread"
---

::: {.callout-note title="Info"}
Eddy covariance raw data files are used to calculate preliminary (Level-0) and final fluxes (Level-1).
:::

## EC raw data were recorded in real-time

Eddy covariance (EC) raw data files are recorded using the **custom-made real-time logging script** `sonicread` ([Eugster & Plüss, 2010](https://doi.org/10.1016/j.agrformet.2009.12.008)). `sonicread` runs on a data logger and directly merges incoming raw data streams (20Hz or 10Hz) arriving from the instruments into one single file. Other loggers can easily be added to the datastream, creating complete data files comprising records from the  sonic anemometer and any number of gas analyzers. Due to the real-time data merging of `sonicread`, it does not have to rely on any timestamps in the data files. This makes handling data from e.g. the QCL much easier, because the QCL logging software uses its own internal clock that is synchronized to the system clock of the QCL computer at regular intervals, and the QCL computer also has to be synchronized to the sonic/IRGA logger.

## File format

Each EC raw data binary file contains a header section at the start of the file, followed by the data records of one installed sonic anemometer (SA) and one or more gas analyzers (GA). One raw data file comprises data over a time period of six hours. The files do not contain a timestamp, but the starting time of each file is written to the file name. Files do also not contain variable names or units. This info is later added during the file conversion using `bico` (see below).

**The binary format of the data files is *compressed and therefore irregularly structured***. One line of data records (i.e., all records for a specific moment in time) can consist of a varying number of bytes and data columns. For example, if all data for all instruments are available at a specific timestamp, one line of data records consists of 26 bytes and 12 data columns. If the data for one instrument are missing, then one line of data records may only consist of 14 bytes and 8 data columns.  An overview of data blocks, including their description, can be found online in the [bico repository](https://github.com/holukas/bico) on GitHub [here](https://github.com/holukas/bico/tree/master/src/settings/data_blocks).

**Data from the instruments arrive in data blocks at the logger**. Because of the real-time nature of `sonicread`, all data blocks are stored to the same file in the moment they are recorded. The data blocks arrive sequentially: first the data block from instrument 1 (typically the sonic anemometer), then from instrument 2 (e.g., LI-7500), followed by other installed instruments (e.g., QCL or LGR). Data arriving from the sonic anemometer are the most reliable (SA runs most of the time) and most consistent (measurement frequency is always very close to the nominal 20Hz), therefore it is used as the "anchor" measurement for each file. This means that each data row starts with the sonic data, then additional data from other instruments are added.

The raw binary files lack any columnar structure or line breaks, presenting all instrument data blocks as a single, contiguous byte stream.

After the SA data block was stored to a file, the gas analyzer data that were available at that moment in time are added after the SA data block. If available, the data block of a second gas analyzer is added similarly. If no gas analyzer record is immediately available after the storing of the SA data block - for example when the GA is running at a lower time resolution such as 10Hz - the previous GA record is repeated. In the end, all files have a time resolution of 20Hz.

Whenever an instrument was added or removed at the site, the format of the raw binary files changed. For example, most of the time the regular structure of a raw binary file consists of (a) sonic data and (b) IRGA data. When a QCL system is installed at the site, the data of this new instrument are added to the sonic and IRGA data, e.g. after 6 columns of sonic data and 8 columns of IRGA data follow 5 columns of QCL data.

Time periods with different instrumental setup have to be calculated separately.

## Creating regularly-structured files for EddyPro

EddyPro can handle *regularly-structured* binary files, but not *irregularly-structured* files. EddyPro needs to know in what sequence data are coming in, i.e. the sequence in which data are stored in a file.

Raw data files were converted to a regular structure (same number of columns for each line of records) using the script [bico](../scripts/bico.md). During this conversion, the raw binary data are sorted into rows and columns, and at the end of one data row a line break is added. This means that one data row of records in the ASCII file consists of the data, sorted into columns, followed by a line break. Measured at 20Hz, there are 20 rows of data records per second. After the conversion, each data row has the same number of columns regardless of missing data, i.e., the data file becomes regularly-structured. Columns that contain no data have the value `-9999` to mark missing values. This way, the files can be directly used in EddyPro for the flux calculations.

`bico` also adds additional information to the CSV files, such as the variable names for each column, and adds the respective units and the source instrument. In addition, `bico` converts the binary files to ASCII format (CSV). This is not strictly required by EddyPro, but it makes the files human-readable, which can be helpful in detecting data issues. To reduce the file size of the ASCII files, the CSV files were zipped (`.gz`). For flux calculations, the `.gz` files are first unzipped and then used in EddyPro using the home-made Python script [fluxrun](../scripts/fluxrun.md).

A typical name for a raw data file after the `bico` conversion is e.g. `CH-CHA_202408091300.csv.gz`, whereby the time info in the file name gives the starting time for the data.

## Example structure of EC binary raw data files

This example describes the structure of a binary raw data file with data from 1 sonic anemometer and 2 different gas analyzers (open-path LI-7500 and LGR).

- HEADER (29 bytes): Contains information created by the logging script `sonicread`. This information is not written to the regular ASCII file, but it is written to the `bico` log file during conversion from binary to ASCII. Each of the irregular binary files contains this header section.
- INSTRUMENT 1: Data block coming from sonic anemometer Solent R3-50 ([R350-B](https://github.com/holukas/bico/blob/master/src/settings/data_blocks/R350-B.dblock)): 12 bytes (big endian short integer).
- INSTRUMENT 2: Data block coming from Li-7500 ([IRGA75-A](https://github.com/holukas/bico/blob/master/src/settings/data_blocks/IRGA75-A.dblock)): 2-16 bytes. In case of 2 bytes, data from the IRGA are missing. 16 bytes means all data available.
- INSTRUMENT 3: Data block coming from the LGR laser ([LGR-A](https://github.com/holukas/bico/blob/master/src/settings/data_blocks/LGR-A.dblock)): 2-33 bytes. In case of 2 bytes, data from the LGR are missing. 33 bytes means all data available

Each full data record (one row of data records for a specific moment in time) within the file occupies 61 bytes, consisting of 12 bytes for the SA data, 16 bytes for IRGA data, and 33 bytes for LGR data. If IRGA data are missing, the record size reduces to 47 bytes (12 bytes SA data, 2 bytes for missing IRGA data, 33 bytes LGR data). Conversely, if LGR data are missing, the record size is 30 bytes (12 bytes SA data, 16 bytes IRGA data, 2 bytes for missing LGR data). A 29-byte header is present at the start of the file, preceding the data records.

| Variable            | Bytes | Instrument | Description                                                                                   |
| ------------------- | ----- | ---------- | --------------------------------------------------------------------------------------------- |
| U                   | 2     | R350-B     | first horizontal wind component (x)                                                           |
| V                   | 2     | R350-B     | second horizontal wind component (y)                                                          |
| W                   | 2     | R350-B     | vertical wind component (z)                                                                   |
| T_SONIC             | 2     | R350-B     | sonic temperature                                                                             |
| SA_DIAG_TYPE        | 1     | R350-B     | status address                                                                                |
| SA_DIAG_VAL         | 1     | R350-B     | status data                                                                                   |
| INC_XY              | 2     | R350-B     | inclinometer, alternatively x (odd record numbers) and y (even record numbers)                |
| DATA_SIZE           | 1     | IRGA75-A   | data size of current data block, number of bytes in IRGA record (2 = missing, 16 = available) |
| STATUS_CODE         | 1     | IRGA75-A   | status of IRGA data acquisition                                                               |
| GA_DIAG_CODE        | 1     | IRGA75-A   | diagnostic value                                                                              |
| H2O_CONC            | 3     | IRGA75-A   | H2O concentration density, molar density                                                      |
| CO2_CONC            | 3     | IRGA75-A   | CO2 concentration density, molar density                                                      |
| T_BOX               | 2     | IRGA75-A   | ambient temperature measured in the control box                                               |
| PRESS_BOX           | 2     | IRGA75-A   | atmospheric pressure measured in the control box                                              |
| COOLER_V            | 3     | IRGA75-A   | cooler voltage                                                                                |
| DATA_SIZE           | 1     | LGR-A      | data size of current data block, number of bytes in LGR record (2 = missing, 33 = available)  |
| STATUS_CODE         | 1     | LGR-A      | status of LGR data aquisition                                                                 |
| CH4_DRY             | 4     | LGR-A      | CH4 dry mole fraction (in dry air), mixing ratio, ppm (parts per million)                     |
| N2O_DRY             | 4     | LGR-A      | N2O dry mole fraction (in dry air), mixing ratio, ppm                                         |
| H2O                 | 4     | LGR-A      | H2O molar fraction (in humid air), wet mole fraction                                          |
| CH4                 | 4     | LGR-A      | CH4 molar fraction (in humid air), wet mole fraction                                          |
| N2O                 | 4     | LGR-A      | N2O molar fraction (in humid air), wet mole fraction                                          |
| PRESS_CELL          | 2     | LGR-A      | pressure in measurement cell                                                                  |
| T_CELL              | 2     | LGR-A      | temperature in measurement cell                                                               |
| T_UNKNOWN           | 2     | LGR-A      | unused temperature                                                                            |
| MIRROR_RINGDOWNTIME | 4     | LGR-A      | mirror ring-down time                                                                         |
| FIT_FLAG            | 1     | LGR-A      | fit flag                                                                                      |

: Example structure of EC binary raw data file. Variables are listed in the order they arrive at the logger. {#tbl-ec-binary}
