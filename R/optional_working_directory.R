#' Decide whether to append the working directory to a filepath
#'
#' This function looks for the presence of the working directory
#' or a colon (indicating a sharepoint location)
#' If it finds none, it appends the working directory
#'
#' This is a safeguard - best practice is to use the 'here' package
#'
#' @param x a string, a filepath
#' @returns a string, either the same filepath, or wd/filepath

optional_working_directory <- function(x){

  needs_wd <-
    (! grepl(getwd(),file)) &
    (! grepl(':',file))

  if(needs_wd(x)){
    return(
      paste0(get_wd(),'/',x)
    )
  }else{
    return(x)
  }

}
