# Wczytanie bazy danych
library(eurostat)
library(dplyr)
dat = get_eurostat("tps00002", type = "code", filters = "none", time_format = "num")
dat = filter(dat, geo != "EU27_2020", geo != "EA19", geo != "EL")  
head(dat)

# Ogolne dane przegladowe o dataset
label_eurostat_vars(dat)
str(dat)
summary(dat)


# Rok 2020
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")


# Rok 2030
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 200), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")



# Rok 2040
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")


# Rok 2050
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")



# Rok 2060
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")



# Rok 2070
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")




# Rok 2080
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")




# Rok 2090
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")




# Rok 2100
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")
