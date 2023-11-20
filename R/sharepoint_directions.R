#' Give directions to a sharepoint file or location
#' As of ver .9005 supports splicing (!!!) vectors in
#' @param remote_link The name of the Sharepoint site e.g. Epidemiology
#' @param ... subsequent subfolders and filename strings, comma separated
#'
#' @return an appropriately formatted filepath for specifying Sharepoint locations in rclone
#' @export
#'
#' @examples
#' \dontrun{
#' # made up location
#' sharepoint_directions('Epidemiology','Surveillance','Giardia','Quarterly Report','Input','2023-Q4_report_data.csv')
#' }
#'
sharepoint_directions <- function(
    remote_link,
    ...
){
  the_dirs <- shQuote(do.call(
    paste,list2(sep='/',...)
  ))

  paste0(remote_link,':',the_dirs)
}
