

#' Pass local directions to movemee functions
#'
#' This is a convenience function
#' all it does is wrap the call in shQuotes
#' So that it can be passed to the terminal
#' "shell" safely even with spaces in it
#'
#' @param ... commas separated directions. Supports splicing (!!!) vectors in
#'
#' @return A character string double quoted for passage to the terminal
#' @export
#'
#' @examples
#'
#'
local_directions <- function(...){
  rlang::inject(shQuotes(here::here(...)))
}
