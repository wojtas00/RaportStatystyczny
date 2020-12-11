
# Wczytanie bazy danych

library(eurostat)
library(dplyr)
library(ggplot2)

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
<<<<<<< HEAD
x = mutate(dat2050, wartosc)
x

=======
>>>>>>> b6149243d5a181fdb1097192ebc9ae33eb14b4b1
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


# procentowy wzrost 2020/2100
pop_2100 = dat2100$values
sp_wzr_20_100 = round(100 - (pop_2020/pop_2100 * 100), 2)
ramka_sp_wzr_20_100 = cbind(kraj_id, sp_wzr_20_100)


kraj_id = dat2020$geo

# procentowy wzrost 2020/2050
pop_2020 = dat2020$values
pop_2050 = dat2050$values
zmiana20_50 = round(100 - (pop_2020/pop_2050 * 100), 2)
ramka_zmiana20_50 = as.data.frame(cbind(kraj_id, zmiana20_50))


# wykres wzrost/spadek 2050

library(ggplot2)
theme_set(theme_bw())

  wykres2050 = ggplot(ramka_zmiana20_50, aes(x=kraj_id, y=zmiana20_50, label=zmiana20_50)) + 
  geom_point(stat='identity', fill="black")  +
  geom_segment(aes(y = 0, 
                   x = kraj_id, 
                   yend = zmiana20_50, 
                   xend = kraj_id), 
               color = "black") +
  geom_text(color="white", size=2) +
  labs(title="Procentowy prognozowany spadek/wzrost populacji miedzy 2020 i 2050") + 
  coord_flip()
wykres2050


  
  sort2050 = arrange(ramka_sp_wzr_20_50.df(as.numeric(sp_wzr_20_50)))











