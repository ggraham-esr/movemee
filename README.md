# movemee - Moving Objects and Various files Easily, Made for Esr Epi team



```
devtools::install_github('ggraham-esr/movemee')
library(movemee)
```

# Using `movemee` to move files to and from Sharepoint

This package was developed to give the ESR Epi team an easy way to use `rclone` in an R script. It consists of a main function `move_file()` and some convenience functions `sharepoint_directions()` and `local_directions()` that help structure directories correctly. Finally there is a separate function called `show_me_files()` that can be used to look into sharepoint for contents of folders. 

To use this package you will need to have configured your rclone remotes. Start by opening a new terminal (alt + shift + R). Type in `module load rclone` and hit return. Then follow Russell Smithies' [Walkthrough](https://kscprod-bioman1.esr.cri.nz/wiki/index.php/Sharepoint_Access_from_Linux). Your induction document will have the relevant names and site urls for your sharepoint sites.

## move_file()

```
move_file(
  file = sharepoint_directions('mySite','Project Folder','Input Data','My Data.csv'),
  destination = local_directions('input_data')
)

```

This is the most straightforward way to use it. You specify a file, and a destination. rclone will move the file listed, and will print out progress along the way. You can move something from sharepoint and to sharepoint, just so long as you've got your sharepoint_directions in the right place.

### Notes on movement particulars:

- You cannot overwrite an open file on Sharepoint
- You can move an open file into Rstudio.
- xlsx files and other Microsoft Office file formats can't be overwritten to sharepoint with default settings. You will need to use some specific rclone options, rclone_options = "--ignore-size  --no-check-dest --progress"
- by default movemee will overwrite the destination file even if it is newer than the source file. To change this use rclone_options = "--update --progress"
- "--progress" means movemee (rather, rclone) will keep you updated with how it's going moving things, and is included in the options by default If this gets annoying remove it from your rclone_options argument, or pass rclone_options = ""

## sharepoint_directions()

```

sharepoint_directions('mySite','Project Folder','Input Data','My Data.csv')

```
This just makes sure the directions are passed in a form that rclone understands. The first argument is always the name of your remote. 

This function supports splicing (!!!) so you can pass vectors too (but you must always specify the remote!):

```


sp_data_location <- c('Project Folder','Input Data')

sharepoint_directions('mySite',!!!sp_data_location)

```

## local_directions()

This is similar to sharepoint directions. It's actually pretty much [here::here](https://here.r-lib.org/), but I've wrapped it up to do two things:
1. allow splicing in of a vector
2. pass strings with spaces in them safely to rclone

```

# if you just used here() rclone would throw an error: 'too many arguments' or something
local_directions('My data','input','extracts')

# also allows splicing

local_data <- c('My data','input','extracts')

local_directions(!!!local_data)
```
## show_me_files()

```
show_me_files(sharepoint_directions('mySite','Where I want to look'))
```
This is to give rudimentary list.files() functionality over Sharepoint locations. It doesn't work on local directions (I think).

## extra for experts

### 'moving' is copying

So by default the function `move_file()` actually copies a file. The key here is the argument `rclone_command = 'copy'`. if you don't want this you have to tweak the `rclone_command` argument i.e. `move_file(file, destination,rclone_command = 'move'`. 

### moving a whole folder

You can specify a folder in the `file` argument. It will copy all contents of that folder to the destination folder. 

### moving several files but not a whole folder

You can pass a vector to the sharepoint_directions or the local_directions without splicing to get a vector of addresses back. Then you can use purrr::map or purrr::map2 to run through `move_file()` with each one.

### rclone_options

Here you can pass the option flags to rclone. Read the [rclone documentation](https://rclone.org/) for more info. Only use this if you're familiar with what rclone is and how it works.
