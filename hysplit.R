
# Load package
# library(devtools)

# Install package from webserver
# install_url("http://172.31.113.9:3838/hyr/package/hyr.zip")

# library(hyr)

# import hysplit data

# Load packages
library(hyr)
library(openair)

# Import data
data_paris <- import_hysplit(site = "paris", start = "2014-06-01", end = "2014-06-07")
data_abudhabi <- import_hysplit(site = "abudhabi", start = "2014-06-01", end = "2014-06-07")
# Show top of data frame
head(data_paris)
trajPlot(data_paris)

head(data_abudhabi)
trajPlot(data_abudhabi)

# Get sites
# Sites with pre-calculated HYSPLIT trajectories
data_sites <- import_hysplit_sites()

##############################################################################################################
##############################################################################################################

#run HYSPLIT
# link to NOAA to install hyspliy on any laptop
# http://ready.arl.noaa.gov/HYSPLIT.php
# http://www.arl.noaa.gov/documents/workshop/Spring2007/HTML_Docs/index.html

# met data
# ftp://arlftp.arlhq.noaa.gov/archives/reanalysis/

# Load package
library(hyr)

run_hysplit

# need to download RP201609.gbl first  from  ftp://arlftp.arlhq.noaa.gov/archives/reanalysis/

# Calculate back trajectories for Auchencorth Moss for 2015
data_moss <- run_hysplit(
  latitude = 55.79216, 
  longitude = -3.2429, 
  runtime = -96, 
  start_height = 10, 
  model_height = 10000, 
  start = "2016-08-01",
  end = "2016-08-31",
  # hysplit_exec = "/AQprojects/hysplit_package/exec", 
  # hysplit_input = "/AQprojects/hysplit_package/hysplit_met_data", 
  # hysplit_output = "/AQprojects/hysplit_package/hysplit_output",
  hysplit_exec = "C:/hysplit4/exec", # run "hyts_std"
  hysplit_input = "C:/hysplit4/hysplit_met_data", 
  hysplit_output = "C:/hysplit4/hysplit_output",
  site = "acth")

trajPlot(data_moss)

# Abu Dhabi
data_abudhabi <- run_hysplit(
  latitude = 24.466667, 
  longitude = 54.366669, 
  runtime = -96, 
  start_height = 10, 
  model_height = 10000, 
  start = "2016-08-01",
  end = "2016-08-31",
  # hysplit_exec = "/AQprojects/hysplit_package/exec", 
  # hysplit_input = "/AQprojects/hysplit_package/hysplit_met_data", 
  # hysplit_output = "/AQprojects/hysplit_package/hysplit_output",
  hysplit_exec = "C:/hysplit4/exec", # run "hyts_std"
  hysplit_input = "C:/hysplit4/hysplit_met_data", 
  hysplit_output = "C:/hysplit4/hysplit_output",
  site = "abudhabi")

trajPlot(data_abudhabi)

# This particular command would produce a data frame suitable for openair's traj* functions and could be inserted into the practice's 
# HYSPLIT database so these data can be imported with import_hysplit from openair package.

######----------------------------------------------------------

# On the fcastadmin server, there is a helper function which allows a user to run trajectories and then insert the data into the database after the run has complete. 
# This function is named run_hysplit_fcastadmin and the argument to use is insert.

# Riyadh train station for 2015
run_hysplit_fcastadmin(
  latitude = 24.651632, 
  longitude = 46.742709,
  runtime = -96,
  start_height = 10,
  start = 2015,
  end = 2015,
  site = "riyadh",
  insert = TRUE)

