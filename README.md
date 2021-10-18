
<!-- README.md is generated from README.Rmd. Please edit that file -->

# simpleschoolsR

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/ztimpe/simpleschoolsR.svg?branch=master)](https://app.travis-ci.com/ztimpe/simpleschoolsR.svg?branch=master)
[![R-CMD-check](https://github.com/ztimpe/simpleschoolsR/workflows/R-CMD-check/badge.svg)](https://github.com/ztimpe/simpleschoolsR/actions)
<!-- badges: end -->

The goal of simpleschoolsR is to alleviate the burden of importing,
cleaning, and matching data sets that rely on U.S. school names and
addresses as the primary key. For example, an analyst who wishes to join
data from the National Center for Education Statistics to data from the
Civil Rights DAta Collection may be able to use NCES IDs. However, in
instances where a common ID is not available, names and addresses may
allow for matching…when they are accurate and consistent across data
frames. Unfortunately, this is rarely the case, resulting in a
frustrating and costly experience for the analyst. This package seeks to
alleviate basic issues stemming from these inconsistencies.

## Installation

This package has not been released on CRAN, but can be downloaded and
used with caution!

``` r
install.packages("simpleschoolsR")
```
