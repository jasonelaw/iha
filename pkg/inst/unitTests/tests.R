# Functions used in tests
library(testthat)
subsetTNC <- function(x, year, group = c(1,2,3,4,5)){
  cols <- switch(group,
                 2:13, c(14,19,15,20,16,21,17,22,18,23:25), 26:27, 28:31, 32:34)
  as.matrix(subset(x, Year == year, select = cols))
}

# Test data file
roan.data <- read.flow(file = system.file('unitTests', 'data', 'Roanoke_River_NC_02080500.usgs', package = 'IHA'))
roan <- zoo(as.numeric(roan.data[,8]), roan.data$datetime)
roan <- na.approx(roan)
roan <- roan[water.year(index(roan)) != 1912]

# Results from version 7.1 of TNC's IHA
tnc.res <- read.csv(file = system.file('unitTests', 'data', 'roanoke.csv', package = 'IHA'))
tnc.res <- subset(tnc.res, Year != 1912)

# 1999
year <- 2000
r99 <- roan[water.year(index(roan)) == year]

my <- group1(r99)
target <- subsetTNC(tnc.res, year = year, group = 1)
expect_that(my, equals(target, check.attributes = F, tolerance = .001))

my <- as.matrix(group2(r99)[,2:13])
target <- subsetTNC(tnc.res, year = year, group = 2)
expect_that(my, equals(target, check.attributes = F, tolerance = 0.001, scale = target))

my <- group3(r99)
target <- subsetTNC(tnc.res, year = year, group = 3)
expect_that(my, equals(target, check.attributes = F, tolerance = 0.001, scale = target))

my <- group4(r99)
target <- subsetTNC(tnc.res, year = year, group = 4)
expect_that(my, equals(target, check.attributes = F, tolerance = 0.001, scale = target))

my <- group5(r99)
target <- subsetTNC(tnc.res, year = year, group = 5)
expect_that(my, equals(target, check.attributes = F, tolerance = 0.001, scale = target))