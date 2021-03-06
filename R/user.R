# Copyright (C) 2019 LINE Corporation
#
# conflr is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, version 3.
#
# conflr is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See <http://www.gnu.org/licenses/> for more details.


#' Non-admin User Operations
#'
#' @name confl_user
#' @param key
#'   Userkey of the user to request from this resource.
#' @param username
#'   Username of the user to request from this resource.
#' @inheritParams confl_content
#'
#' @return
#'   The API response as a list.
#'
#' @examples
#' \dontrun{
#' # Get the information of the current user
#' my_user <- confl_get_current_user()
#'
#' # Show display name
#' my_user$displayName
#'
#' # Get the information of a user whose name is "user1"
#' other_user <- confl_get_user(username = "user1")
#' }
#'
#' @export
confl_get_user <- function(key = NULL, username = NULL, expand = NULL) {
  query <- list(key = key, username = username, expand = expand)
  res <- confl_verb("GET", "/user", query = purrr::compact(query))
  httr::content(res)
}

#' @rdname confl_user
#' @export
confl_get_current_user <- function(expand = NULL) {
  query <- list(expand = expand)
  res <- confl_verb("GET", "/user/current", query = purrr::compact(query))
  httr::content(res)
}
