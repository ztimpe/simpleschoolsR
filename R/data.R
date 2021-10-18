#' Data to help solve common issues with elements of addresses
#'
#' Special character abbreviations
#'
#' @source postmastr package
#' @format A data frame with columns:
#' \describe{
#'  \item{intersect.input}{An abbreviation for "at"}
#'  \item{intersect.output}{The word "at"}
#'  }
   "intersections"
#'  Common school name abbreviations
#'
#' @format A data frame with columns:
#' \describe{
#'  \item{input}{Common abbreviation}
#'  \item{output}{Unified output of abbreviations}
#'   }
   "school_strings"
#'  Common abbreviations for directions
#'
#' @source postmastr package
#' @format A data frame with columns:
#' \describe{
#'  \item{dir.input}{Common directional abbreviation}
#'  \item{dir.output}{Unified output of abbreviations}
#'   }
   "directional_abbs"
#'  Common abbreviations for street suffixes
#'
#' @source postmastr package
#' @format A data frame with columns:
#' \describe{
#'  \item{suf.type}{Categorized street type}
#'  \item{suf.input}{Common abbreviation}
#'  \item{suf.output}{Unified output of abbreviations}}
   "dic_us_suffix"
#' @examples
#' \dontrun{
#'   special_char_abbs.rda
#'   }
#' \dontrun{
#'   school_strings.rda
#'   }
#' \dontrun{
#'   directional_abbs.rda
#'   }
#' \dontrun{
#'   dic_us_suffix.rda
#'   }
