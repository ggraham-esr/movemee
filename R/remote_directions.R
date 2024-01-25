#' Give directions to any remote file or location
#' renaming the sharepoint directions for the cases where we're not using a sharepoint link
#' As of ver .9005 supports splicing (!!!) vectors in
#' @param remote_link The name of the rclone remote link
#' @param ... subsequent subfolders and filename strings, comma separated
#'
#' @return an appropriately formatted filepath for specifying remote locations in rclone
#' @export
#'
#' @examples
#' \dontrun{
#' # made up location
#' remote_directions('Epidemiology','Surveillance','Giardia','Quarterly Report','Input','2023-Q4_report_data.csv')
#' }
#'
remote_directions <- function(remote_link,
                              ...) {
  sharepoint_directions(remote_link,
                        ...)
}
