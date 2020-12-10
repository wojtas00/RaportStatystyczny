library(eurostat)
dat <- get_eurostat("tps00002", type = "code", filters = "none", time_format = "num")
head(dat)
label_eurostat_vars(dat)
str(dat)
summary(dat)

-c("EU27_2020", "EA19", "EL")
dat$geo <- substr(dat$geo)

library(dplyr)
dat = filter(dat, geo != "EU27_2020", geo != "EA19", geo != "EL")  

EU2020 = filter(dat, time == 2020-01-01)



library(knitr)
library(rvest)

kable(head(dat))
dat2$time
dat2 <- get_eurostat("tps00002", type = "code", filters = list(geo = c("PL", "CZ"), time = 2019), time_format = "num")
dat3 = subset(dat2, time == 2019)

kable(dat2)
