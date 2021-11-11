
#' The addresses functions data and functions are used to simplify the process
#' of fixing school addresses for the purposes of matching.

#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @importFrom rlang :=
#' @importFrom stringr str_replace_all
#' @importFrom stringr str_to_title
#' @importFrom tidyselect everything
#'

#' @title clean_addresses
#'
#' @description This function removes and replaces common address pronouns
#' and abbreviations to prepare for matching.
#'
#' @param .data The data frame that is intended for modification.
#' @param var   The column of school address that will be modified.
#' @param vec_of_strings Optional vector of character strings to replace
#' @return clean_addresses returns a data frame with the new column 'clean_address'
#' in the first position, followed by the original address column, and finally
#' the rest of the columns. None are dropped. If 'var' is not character, original
#' data frame is returned.
#' @note returns original data frame if selected column is not character.
#' @export

clean_addresses <- function(.data,var,vec_of_strings=NULL){
  df_exp <- substitute(is.character(.data$var))
  if(eval(df_exp)==TRUE){
     if(!is.null(vec_of_strings)==TRUE){
    tmp_df <- .data %>%
    mutate(clean_address = tolower({{ var }}) %>% str_replace_all(vec_of_strings),
           clean_address = str_replace_all(clean_address,"(?<=[[:digit:]])(rd|th|st|nd)",""),
           clean_address = str_replace_all(clean_address,"(rd|th|st|nd|blvd|dr|ln|ave|pkwy|ct|pky|av)$",""),
           address_number = str_extract(clean_address,"^[:digit:]*"),
           address_number = case_when(str_detect(clean_address,"pobox") ~ str_extract(clean_address,"(?<=pobox)[:alnum:]*"),
                                      !is.na(address_number) ~ address_number),
           "{{var}}" := str_to_title({{ var }}))%>%
    select(clean_address,address_number,{{ var }},everything())

    tmp_df
     }
     else{stop('You must supply a list of strings if you have not loaded address_strings function')}
  }
  else{
    message('var is not of class character')
    return(.data)}
}

#' @title address_strings
#'
#' @description This function simply loads a character vector of common
#' address names and abbreviations.
#' @param frame Optionally return data frame. If so, will not work with clean_addresses.
#' @return address_strings returns a character vector.
#' @note Optionally return data frame.
#' @export

address_strings <- function(frame=FALSE){
  if(frame==TRUE){
    tmp_df <- data.frame(input=c("[^[:alnum:]]", "drive", "street", "road",
               "boulevard", "avenue", "court", "first",  "second",
               "third",  "fourth",  "fifth", "sixth", "seventh", "eighth",
               "ninth", "tenth", "north", "south", "east", "west", "northwest",
               "northeast", "southeast", "southwest", "parkway", "freeway",
               "plaza", "center"),
        output=c("", "dr","st","rd","blvd","ave", "ct", "1st", "2nd",  "3rd",
                 "4th", "5th", "6th", "7th", "8th", "9th", "10th", "n",
                 "s", "e", "w", "nw", "ne", "se", "sw", "pky", "fwy", "plz",
                 "ctr"))
    return(tmp_df)}
  else{c("[^[:alnum:]]" = "",
           "drive"        = "dr",
           "street"       = "st",
           "road"         = "rd",
           "boulevard"    = "blvd",
           "avenue"       = "ave",
           "court"        = "ct",
           "first"        = "1st",
           "second"       = "2nd",
           "third"        = "3rd",
           "fourth"       = "4th",
           "fifth"        = "5th",
           "sixth"        = "6th",
           "seventh"      = "7th",
           "eighth"       = "8th",
           "ninth"        = "9th",
           "tenth"        = "10th",
           "north"        = "n",
           "south"        = "s",
           "east"         = "e",
           "west"         = "w",
           "northwest"    = "nw",
           "northeast"    = "ne",
           "southeast"    = "se",
           "southwest"    = "sw",
           "parkway"      = "pky",
           "freeway"      = "fwy",
           "plaza"        = "plz",
           "center"       = "ctr"

  )}
}

#' @examples
#' \dontrun{clean_addresses(.data = nces_schools, var = address)}
#' \dontrun{address_strings()}
