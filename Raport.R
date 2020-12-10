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
dat2030 = get_eurostat("tps00002", type = "code", filters = list(time = 2030), time_format = "num")
dat2030 = filter(dat2030, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2030 = filter(dat2030, sex == "T")



# Rok 2040
dat2040 = get_eurostat("tps00002", type = "code", filters = list(time = 2040), time_format = "num")
dat2040 = filter(dat2040, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2040 = filter(dat2040, sex == "T")


# Rok 2050
dat2050 = get_eurostat("tps00002", type = "code", filters = list(time = 2050), time_format = "num")
dat2050 = filter(dat2050, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2050 = filter(dat2050, sex == "T")



# Rok 2060
dat2060 = get_eurostat("tps00002", type = "code", filters = list(time = 2060), time_format = "num")
dat2060 = filter(dat2060, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2060 = filter(dat2060, sex == "T")



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
