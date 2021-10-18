# library(simpleschoolsR)
context("simpleschoolsR")

tmp_df <- data.frame(the_name=c("Paola High School","Paolahigh schOOl","paola high school"),
                     a_number = c(1,2,3))
example_strings <- c("high"="h","school"="s")

test_that("Test that clean_schools returns error if no arguments specified", {
  expect_error(clean_schools(),"argument is missing, with no default")
})


test_that("Test that clean_schools returns a data frame when correctly specified", {

 test_output <- clean_schools(.data = data.frame(the_name=c("Paola High School","Paolahigh schOOl","paola high school"),
                                                 a_number = c(1,2,3)),var = the_name,vec_of_strings = example_strings)
 expect_type(test_output,"list")
})
