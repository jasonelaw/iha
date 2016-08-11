# Functions used in tests
library(testthat)
library(IHA)
subsetTNC <- function(x, year, group = c(1,2,3,4,5)){
  cols <- switch(group,
                 2:13, c(14,19,15,20,16,21,17,22,18,23:25), 26:27, 28:31, 32:34)
  as.matrix(subset(x, Year %in% year, select = cols))
}

# Test data file
roan.data <- read.flow(file = 'tests/testthat/Roanoke_River_NC_02080500.usgs')
roan <- zoo(as.numeric(roan.data[,8]), roan.data$datetime)
roan <- na.approx(roan)
roan <- roan[water.year(index(roan)) != 1912]

# Results from version 7.1 of TNC's IHA
tnc.res <- read.csv(file = 'tests/testthat/roanoke.csv')
tnc.res <- subset(tnc.res, Year != 1912)

# 2000

test_that("Results match TNC code.", {
  year <- 2000
  r99 <- roan[water.year(index(roan)) == year]
  
  my <- group1(r99)
  target <- subsetTNC(tnc.res, year = year, group = 1)
  expect_that(my, equals(target, check.attributes = F))
  
  my <- as.matrix(group2(r99)[,2:13])
  target <- subsetTNC(tnc.res, year = year, group = 2)
  # Check that scaled absolute difference is < 0.01
  expect_that(signif(my, 4), equals(target, check.attributes = F))
})




my <- group3(r99, mimic.tnc = T)
target <- subsetTNC(tnc.res, year = year, group = 3)
expect_that(my, equals(target, check.attributes = F))

my <- group4(r99, thresholds = quantile(coredata(roan), c(0.25, 0.75)))
target <- subsetTNC(tnc.res, year = year, group = 4)
expect_that(my, equals(target, check.attributes = F))

my <- group5(r99)
target <- subsetTNC(tnc.res, year = year, group = 5)
expect_that(my, equals(target, check.attributes = F))

# All
my <- group1(roan)
target <- subsetTNC(tnc.res, unique(year(index(roan))), 1)
# Absolute value of scaled difference within 1% of target
expect_that(my, equals(target, check.attributes = F, scale = target, tolerance = 0.01))

my <- as.matrix(group2(roan, mimic.tnc = T)[, 2:13])
target <- subsetTNC(tnc.res, unique(year(index(roan))), 2)
# Absolute value of scaled difference within 0.1% of target
expect_that(signif(my, 4), equals(target, check.attributes = F))

my <- group3(roan, mimic.tnc = T)
target <- subsetTNC(tnc.res, year = unique(year(index(roan))), group = 3)
expect_that(my, equals(target, check.attributes = F))

my <- group4(roan, thresholds = quantile(coredata(roan), c(0.25, 0.75)))
target <- subsetTNC(tnc.res, year = unique(year(index(roan))), group = 4)
expect_that(my, equals(target, check.attributes = F))

my <- group5(roan)
target <- subsetTNC(tnc.res, year =unique(year(index(roan))), group = 5)
expect_that(my, equals(target, check.attributes = F))
