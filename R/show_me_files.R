

#' Show the contents of a sharepoint directory
#'
#' @param location
#' @param rclone_options
#'
#' @return
#' @export
#'
#' @examples
show_me_files <- function(
    location,
    rclone_options = NULL,
){

  if(!grepl(location,':')){
    stop('no sharepoint location specified')
  }
  open_rclone <- 'module load rclone;'
  close_rclone <- ';module unload rclone'
  rclone_command <- 'rclone lsjson'

  system_command <- paste(
    open_rclone,
    rclone_command,
    rclone_options,
    location,
    close_rclone
  )

  temp_file_list <- system(system_command,intern=TRUE)

  jsonlite::fromJSON(temp_file_list)
}
