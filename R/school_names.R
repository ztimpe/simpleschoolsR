
#' The simpleschoolsR package is collection of concise data sets and functions
#' designed to alleviate the burden of importing, cleaning, and
#' matching data sets with U.S. schools as a primary key. For example,
#' an analyst who wishes to join data from the National Center for Education
#' Statistics to data from the Civil Rights DAta Collection may be able to
#' use NCES IDs. However, in instances where a common ID is not available,
#' names and addresses may allow for matching...when they are accurate and
#' consistent across data frames. Unfortunately, this is rarely the case, resulting
#' in a frustrating and costly experience for the analyst. This package seeks to
#' alleviate basic issues stemming from these inconsistencies.

#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @importFrom rlang :=
#' @importFrom stringr str_replace_all
#' @importFrom stringr str_to_title
#' @importFrom tidyselect everything
#'

#' @title clean_schools
#'
#' @description This function removes and replaces common school pronouns
#' and abbreviations to prepare for matching on school name.
#'
#' @param .data The data frame that is intended for modification.
#' @param var   The column of school names that will be modified.
#' @param vec_of_strings Optional vector of character strings to replace
#' @return clean_schools returns a data frame with the new column 'clean_school'
#' in the first position, followed by the original school name column, and finally
#' the rest of the columns. None are dropped. If 'var' is not character, original
#' data frame is returned.
#' @note returns original data frame if selected column is not character.
#' @export

clean_schools <- function(.data,var,vec_of_strings=NULL){
  df_exp <- substitute(is.character(.data$var))
  if(eval(df_exp)==TRUE){
     if(!is.null(vec_of_strings)==TRUE){
    tmp_df <- .data %>%
    mutate(clean_school = tolower({{ var }}) %>% str_replace_all(vec_of_strings),
           "{{var}}" := str_to_title({{ var }}))%>%
    select(clean_school,{{ var }},everything())

    tmp_df
     }
     else{stop('You must supply a list of strings if you have not loaded school_strings function')}
  }
  else{
    message('var is not of class character')
    return(.data)}
}

#' @title school_strings
#'
#' @description This function simply loads a character vector of common
#' school names and abbreviations.
#' @param frame Optionally return data frame. If so, will not work with clean_schools.
#' @return school_strings returns a character vector.
#' @note Optionally return data framereturns original data frame if selected column is not character.
#' @export

school_strings <- function(frame=FALSE){
  if(frame==TRUE){
    tmp_df <- data.frame(input=c("[^[:alnum:]]", "highschool", "high","school",
        "senior","academy","acdmy","community","and","science","preparatory","international",
        "educational"),
        output=c("", "hs","h","s","s","acad", "acad", "comm", "", "sci","prep", "intl", "educ"))
    return(tmp_df)}
  else{c("[^[:alnum:]]" = "",
                            "highschool"               ="hs",
                            "high"                     = "h",
                            "school"                   = "s",
                            "senior"                   = "s",
                            "academy"                  = "acad",
                            "acdmy"                    = "acad",
                            "community"                = "comm",
                            "and"                      = "",
                            "science"                  = "sci",
                            "preparatory"              = "prep",
                            "international"            = "intl",
                            "educational"              = "educ"

  )}
}
#' @examples
#' \dontrun{clean_schools(.data = nces_schools, var = school_name)}
#' \dontrun{school_strings()}
