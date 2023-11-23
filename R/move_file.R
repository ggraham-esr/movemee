

#' Move file(s) to or from Sharepoint
#'
#' @param file filepath to file you want moved. Use here() for local files, sharepoint_directions() for sharepoint files
#' @param destination filepath to folder you want file moved to. Use here() for local destinations, sharepoint_directions() for sharepoint destinations.
#' @param rclone_options options to send to rclone. advanced use only
#' @param show_command_line_command optionally see the command run in the terminal
#'
#' @return rclone program output on file transfer status
#' @export
#'
#' @examples
#' \dontrun{
#'
#'
#' output_location <- sharepoint_directions('Some Sharepointsite','A Project','Random Analysis','Output Folder')
#'
#' move_file(
#' here('output','final_graph.png'),
#' output_location
#' )
#'
#' }
move_file <- function(
    file,
    destination,
    rclone_command = 'rclone copy',
    rclone_options = '--progress',
    show_command_line_command = FALSE

){

  if(!any(grepl(':',c(file,destination)))){
    stop(
      'You haven\'t specified a sharepoint location,
      only two local locations'
      )
  }
  open_rclone <- 'module load rclone;'
  close_rclone <- ';module unload rclone'

  system_command <- paste(
    open_rclone,
    rclone_command,
    rclone_options,
    file,
    destination,
    close_rclone
  )
  if(show_command_line_command){
    cat(system_command)
  }
  cat(system(system_command,intern=TRUE),sep='\n')
}
