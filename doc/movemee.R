## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(movemee)

## -----------------------------------------------------------------------------

sharepoint_directions('mySite','Project Folder','Input Data','My Data.csv')


## -----------------------------------------------------------------------------


sp_data_location <- c('Project Folder','Input Data')

sharepoint_directions('mySite',!!!sp_data_location)


## -----------------------------------------------------------------------------

# if you just used here() rclone would throw an error: 'too many arguments' or something
local_directions('My data','input','extracts')

# also allows splicing

local_data <- c('My data','input','extracts')

local_directions(!!!local_data)

