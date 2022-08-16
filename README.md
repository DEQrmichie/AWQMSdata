# AWQMSdata

AWQMSdata was created to load data from Oregon DEQ AWQMS into R. **This is intended for internal Oregon DEQ users. Public users should use the AWQMS frontend located [here.](https://www.oregon.gov/deq/wq/Pages/WQdata.aspx)**

There is a Shiny App that can be used to help put together the data retrieval function. You can clone or download that app [here.](https://github.com/TravisPritchardODEQ/AWQMSdata_ShinyHelp)

Note that this package is currently a work in progress. It is being developed by Travis Pritchard- [pritchard.travis\@deq.state.or.us](mailto:pritchard.travis@deq.state.or.us)

## Installation

***You need an ODBC connection to the AWQMS database named AWQMS, and read access to VW_AWQMS_Results. You will also need an ODBC connection to the Stations databse named STATIONS***

-   Staff will need to send a request to helpdesk to be added to the LabDBAWQMSODBC and the LABDBSTATIONUSER User Groups on the LEAD-LIMS server.
-   Add an ODBC connection to AWQMS on server named **AWQMS**.
-   Add an ODBC connection to the stations database named **STATIONS**.
-   Email Travis Pritchard for help setting up ODBC connections.

You also need to have the [devtools](https://github.com/hadley/devtools) package installed.

    install.packages("devtools")

To install AWQMSdata:<br/> *Note - The install process only needs to be run once (or when the package gets updated)*

    library(devtools)
    install_github("TravisPritchardODEQ/AWQMSdata")

AWQMSdata is now installed on your computer and can be loaded like any other package.

    library(AWQMSdata)

**You must run AWQMS_set_servers() after install to point the functions to the correct server location.** See script on ***WQ_Share at TPritchard\\AWQMSdata_environ_script*** for the correct parameters. This only needs to be run once.

## Description

This package contains the following functions:

-   **AWQMS_Chars(project, station)** - Returns characteristics available for downloading from AWQMS
-   **AWQMS_Projects()** - Returns projects available for downloading from AWQMS
-   **AWQMS_Orgs(project, station)** - Returns organizations with data available for downloading from AWQMS
-   **AWQMS_Stations(project, char, HUC8, HUC8_Name, org, crit_codes)** - Returns information about monitoring locations
-   **AWQMS_Data(startdate, enddate, station, project, char, stat_base, HUC8, HUC8_Name, HUC10, HUC12, HUC12_Name media, org, HUC8, crit_codes, filterQC)** - Returns data from AWQMS
-   **AWQMS_Data_Cont(startdate, enddate, station, AU_ID, char, media, org HUC8, HUC8_Name, HUC10, HUC12, HUC12_Name, Result_Status, crit_codes)** - Returns raw continuous data from AWQMS
-   **query_stations(stations_odbc, mlocs, huc8_name, huc10_name, huc12_name, huc8, huc10, huc12, au_id, gnis_name, reachcode, owrd_basin, state )** - Retrieve station information from ODEQ's Stations database based on a set of query paramaters.\
-   **Mlocs_crit(mlocs, stations_odbc)** - Returns criteria codes and site speific criteria

<br/> <br/>

#### Available functions:

+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| Function Name       | Arguments                                                                                                                                                                                                                          | Description                                                                                                                          |                   |
+=====================+====================================================================================================================================================================================================================================+======================================================================================================================================+===================+
| `AWQMS_Data`        | startdate <br/> enddate <br/> station <br/> AU_ID <br/>project <br/> char <br/> stat_base <br/> media <br/> submedia <br/> org <br/> HUC8 <br/> HUC8_Name <br/> HUC10 <br/> HUC12 <br/> HUC12_Name <br/> crit_codes <br/> filterQC | Retrieve a dataframe of data exported from AWQMS. If crit_codes = TRUE, it will bring in standard criteria codes also                |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Data_Cont`   | startdate <br/> enddate <br/> station <br/> AU_ID <br/> char <br/> media <br/> org <br/> HUC8 <br/> HUC8_Name <br/> HUC10 <br/> HUC12 <br/> HUC12_Name <br/> Result_Status <br/> crit_codes                                        | Retrieve a dataframe of raw continious data exported from AWQMS. If crit_codes = TRUE, it will bring in standard criteria codes also |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Chars`       | project <br/> station                                                                                                                                                                                                              | Return a dataframe of available characteristics                                                                                      |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Orgs`        | project <br/> station                                                                                                                                                                                                              | Return a dataframe of available organizations                                                                                        |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Projects`    | \-                                                                                                                                                                                                                                 | Return a dataframe of available projects                                                                                             |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Stations`    | project <br/> char <br/> HUC8 <br/> HUC8_Name <br/> org <br/> crit_codes                                                                                                                                                           | Return a dataframe of available stations. If crit_codes = TRUE, it will bring in standard criteria codes also                        |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Bio_Indexes` | startdate                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | enddate                                                                                                                                                                                                                            | Retrieve Bio_Indexes data from Oregon DEQ AWQMS                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | station                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | AU_ID                                                                                                                                                                                                                              |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC12_Name                                                                                                                                                                                                                         |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | project                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | org                                                                                                                                                                                                                                |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | ReferenceSite                                                                                                                                                                                                                      |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Index_Name                                                                                                                                                                                                                         |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | DQL                                                                                                                                                                                                                                |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | return_query                                                                                                                                                                                                                       |                                                                                                                                      |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Bio_Metrics` | startdate                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | enddate                                                                                                                                                                                                                            | Retrieve Bio_Metrics data from Oregon DEQ AWQMS                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | station                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | AU_ID                                                                                                                                                                                                                              |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC12_Name                                                                                                                                                                                                                         |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | project                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | org                                                                                                                                                                                                                                |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | ReferenceSite                                                                                                                                                                                                                      |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Metric_Name                                                                                                                                                                                                                        |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | DQL                                                                                                                                                                                                                                |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | return_query                                                                                                                                                                                                                       |                                                                                                                                      |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `AWQMS_Raw_Macros`  | startdate                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | station                                                                                                                                                                                                                            | Retrieve raw macroinvertebrate data from Oregon DEQ AWQMS                                                                            |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | AU_ID                                                                                                                                                                                                                              |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | project                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | org                                                                                                                                                                                                                                |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Wade_Boat                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     | ReferenceSite                                                                                                                                                                                                                      |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC8                                                                                                                                                                                                                               |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC8_Name                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC10                                                                                                                                                                                                                              |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC12                                                                                                                                                                                                                              |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | HUC12_Name                                                                                                                                                                                                                         |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Char_Name                                                                                                                                                                                                                          |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Bio_Intent                                                                                                                                                                                                                         |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Taxonomic_Name                                                                                                                                                                                                                     |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | StageID                                                                                                                                                                                                                            |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | UniqueTaxon                                                                                                                                                                                                                        |                                                                                                                                      |                   |
|                     |                                                                                                                                                                                                                                    |                                                                                                                                      |                   |
|                     | Analytical_method                                                                                                                                                                                                                  |                                                                                                                                      |                   |
|                     | return_query                                                                                                                                                                                                                       |                                                                                                                                      |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+
| `Mlocs_crit`        | mlocs <br/> stations_odbc                                                                                                                                                                                                          | Return a dataframe of stations combined with site spefic standard codes                                                              |                   |
+---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+-------------------+

<br/>

#### Data tables included in package

+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| Table Name        | Fields                                                                                                  | Description                                                                                                                  |
+===================+=========================================================================================================+==============================================================================================================================+
| `Bacteria_crit`   | BacteriaCode <br/> Bacteria_SS_Crit <br/> Bacteria_Geomean_Crit <br/> Bacteria_Percentage_Crit          | OBSOLETE Bacteria Criteria table. Join by BacteriaCode                                                                       |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `Chla_crit`       | MonLocType <br/> Chla_Criteria                                                                          | Chlorophyll a criteria table. Join by MonLocType                                                                             |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `DO_crit`         | DO_code <br/> DO_30D_crit <br/> DO_7Mi_crit <br/> DO_abs_min_crit <br/> DO_Instant_crit                 | Dissolved Oxygen Criteria Table. Join by DO_code                                                                             |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `pH_crit`         | pH_code <br/> pH_Min <br/> pH_Max                                                                       | pH criteria table. Join by pH_code                                                                                           |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `Temp_crit`       | FishCode <br/> Temp_Criteria <br/> Comment                                                              | Temperature Criteria outside of spawning time periods. Spawning criteria = 13.0. Join by FishCode                            |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `ToxAL_crit`      | Pollu_ID <br/> Pollutant <br/> Acute_FW <br/> Chronic_FW <br/> Acute_SW <br/> Chronic_SW <br/> Fraction | Aquatic life toxics criteria. Currently a tricky one to join due to differences in parameter names Need to join by Pollu_ID  |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `ToxHH_crit`      | Pollu_ID <br/> Pollutant <br/> WaterOrganism <br/> Organism <br/> Organism_SW <br/> Fraction            | Human health toxics criteria. Currently a tricky one to join due to differences in parameter names. Need to join by Pollu_ID |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `LU_BacteriaCode` | Bacteria_class <br/> Bacteria_code                                                                      | Lookup table to connect numeric bacteria code to bacteria class. Join by Bacteria_code                                       |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `LU_DOCode`       | DO_Class <br/> DO_code                                                                                  | Lookup table to connect numeric DO code to DO classification. Join by DO_code                                                |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `LU_FishUse`      | FishUse <br/> FishUse_code                                                                              | Lookup table to connect numeric Fish use code to fish use designations                                                       |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `LU_Spawn`        | SpawnCode <br/> Spawn_dates <br/> SpawnStart <br/> SpawnEnd                                             | Lookup table to obtain spawning dates from spawn code. Join by SpawnCode or DO_Spawncode                                     |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+
| `Bact_crit`       | BacteriaCode <br/> SS_Crit <br/> Geomean_Crit <br/> Perc_Crit                                           | *OBSOLETE* Bacteria Criteria table. Join by BacteriaCode                                                                     |
+-------------------+---------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------+

## Usage

#### AWQMS_Data

Use `AWQMS_Data()` to retrieve data from Oregon DEQ AWQMS database. This dataset is too large to load into R, so you must include parameters to filter down the data. The default start date is 1949-09-15, which represents the earliest datapoint available in AWQMS.

Note - There is a shiny app to help put together this function. The app helps by allowing you to select from lists of valid values. You can clone or download the app [here](https://github.com/TravisPritchardODEQ/AWQMSdata_ShinyHelp) and run locally on your machine.

To retrieve all available data from 1/1/2017 - 12/31/2017:

    data <- AWQMS_Data(startdate = '2017-01-01', enddate = '2017-12-31')

To retrieve all available data from 1/1/2017 - 12/31/2017 generated by Oregon DEQ

    data <- AWQMS_Data(startdate = '2017-01-01', enddate = '2017-12-31', org = c('OREGONDEQ') )

To retrieve water temperature and dissolved oxygen data from 1/1/2017 - 12/31/2017 generated by Oregon DEQ:

    data <- AWQMS_Data(startdate = '2017-01-01', enddate = '2017-12-31', char = c('Temperature, water', 'Dissolved oxygen (DO)') , org = c('OREGONDEQ') )

`AWQMS_Data()` defaults to removing QC data. Leaving `filterQC = TRUE` will remove data for site '10000-ORDEQ' and with activity_type that contains 'Quality Control'. To include the QC data:

    data <- AWQMS_Data(startdate = '2017-01-01', enddate = '2017-12-31', char = c('Temperature, water', 'Dissolved oxygen (DO)') , org = c('OREGONDEQ') , filterQC = FALSE)

<br/>

#### AWQMS_Chars

Use `AWQMS_Chars()` to return available characteristics from AWQMS. Arguments can be project or station

To return all available characteristics in AWQMS:

    characteristics <- AWQMS_Chars()

To return all available characteristics in the VolMon program:

    characteristics <- AWQMS_Chars(project = 'ODEQVolMonWQProgram')

To return all available characteristics for Volmon and Continuous Water Quality Monitoring:

    characteristics <- AWQMS_Chars(project = c('ODEQVolMonWQProgram', 'Continuous Water Quality Monitoring'))

<br/>

#### AWQMS_Projects

Use `AWQMS_Projects()` to return all available projects from AWQMS. This function will include projects found in the Project1, Project2, and Project3 fields. This function doesn't take any arguments.

    projects <- AWQMS_Projects()

A vector of projects can be then created.

    projects_vector <- projects$Project

<br/>

#### AWQMS_Stations

Use `AWQMS_Stations()` to return available stations from AWQMS. This function's arguments can include any or all of vectors of project, characteristics, HUC8, HUC8 name, or organization.

To see all available stations:

    stations <- AWQMS_Stations()

To see stations that are associated with Oregon DEQ:

    stations <- AWQMS_Stations(org = 'OREGONDEQ')

To see stations with water temperature and dissolved oxygen data:

    stations <- AWQMS_Stations(char = c('Temperature, water', 'Dissolved oxygen (DO)'))

To see stations with water temperature and dissolved oxygen data in the Middle Fork John Day:

    stations <- AWQMS_Stations(char = c('Temperature, water', 'Dissolved oxygen (DO)'), HUC8 = '17070203')

For all the functions in this package, the arguments can be a single parameter or a vector of parameters. For example, to see stations with water temperature and dissolved oxygen data in the Middle Fork John Day, and the Lower John Day :

    stations <- AWQMS_Stations(char = c('Temperature, water', 'Dissolved oxygen (DO)'), HUC8 = c('17070203', '17070204'))

<br/>

#### AWQMS_Orgs

Use `AWQMS_Orgs()` to return available organizations from AWQMS. This function's arguments can include vectors of project or stations.

To return all available organizations in AWQMS:

    organizations <- AWQMS_Orgs()

To return all available organizations that have water temperature and dissolved oxygen data for the Middle and Lower John Day:

    > stations <- AWQMS_Stations(char = c('Temperature, water', 'Dissolved oxygen (DO)'), HUC8_Name = c('Middle Fork John Day', 'Lower John Day'))  
    > stations_vector <- stations$MLocID  
    > organizations <- AWQMS_Orgs(station = stations_vector)  

<br/>

#### query_stations

Use `query_stations()` to return station information from the Stations Database. This differs from AWQMS_Stations() in that it directly queries the stations database, as opposed to going through AWQMS.

    # Retrieve information from all stations in the North Coast Admin Basin
    stations <- query_stations(owrd_basin = 'North Coast')
