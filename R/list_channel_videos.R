#' Returns List of Requested Channel Videos
#' 
#' Iterate through the \code{max_results} number of playlists in channel and get
#' the videos for each of the playlists. 
#' 
#' @param channel_id String. ID of the channel. Required. 
#' @param max_results Maximum number of videos returned. Integer. Default is 50. 
#' If the number is over 50, all the videos will be returned.
#' @param page_token  Specific page in the result set that should be returned. Optional.
#' @param hl  Language used for text values. Optional. Default is \code{en-US}. For other allowed language codes, see \code{\link{list_langs}}
#' @param \dots Additional arguments passed to \code{\link{tuber_GET}}.
#'
#' @return list of \code{data.frame} with each list corresponding to a different
#' playlist
#' 
#' @export
#' 
#' @references \url{https://developers.google.com/youtube/v3/docs/channels/list}
#' 
#' @examples
#' 
#' \dontrun{
#' 
#' # Set API token via yt_oauth() first
#' 
#' list_channel_videos(channel_id = "UCXOKEdfOFxsHO_-Su3K8SHg")
#' list_channel_videos(channel_id = "UCXOKEdfOFxsHO_-Su3K8SHg", max_results = 10)
#' }

list_channel_videos <- function (channel_id = NULL, max_results = 50,
                                 page_token = NULL, hl = "en-US", ...) {

  if (!is.character(channel_id)) stop("Must specify a channel ID.")

  playlist_id <- gsub("^..", "UU", channel_id)

  # Get videos on all the playlists
  videos <- get_playlist_items(filter = c(playlist_id = playlist_id),
                               max_results = max_results,
                               page_token = page_token,
                               hl = hl, ...)
  videos
}
