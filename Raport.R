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
x = mutate(dat2050, wartosc)
x

# Rok 2060
dat2060 = get_eurostat("tps00002", type = "code", filters = list(time = 2060), time_format = "num")
dat2060 = filter(dat2060, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2060 = filter(dat2060, sex == "T")



# Rok 2070
dat2070 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2070 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2070 = filter(dat2020, sex == "T")




# Rok 2080
dat2080 = get_eurostat("tps00002", type = "code", filters = list(time = 2080), time_format = "num")
dat2080 = filter(dat2080, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2080 = filter(dat2080, sex == "T")




# Rok 2090
dat2090 = get_eurostat("tps00002", type = "code", filters = list(time = 2090), time_format = "num")
dat2090 = filter(dat2090, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2090 = filter(dat2090, sex == "T")




# Rok 2100
dat2100 = get_eurostat("tps00002", type = "code", filters = list(time = 2100), time_format = "num")
dat2100 = filter(dat2100, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2100 = filter(dat2100, sex == "T")
