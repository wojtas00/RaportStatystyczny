
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
#dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
#dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2020 = filter(dat2020, sex == "T")
# Rok 2030
#dat2030 = get_eurostat("tps00002", type = "code", filters = list(time = 2030), time_format = "num")
#dat2030 = filter(dat2030, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2030 = filter(dat2030, sex == "T")
# Rok 2040
#dat2040 = get_eurostat("tps00002", type = "code", filters = list(time = 2040), time_format = "num")
#dat2040 = filter(dat2040, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2040 = filter(dat2040, sex == "T")
# Rok 2050
#dat2050 = get_eurostat("tps00002", type = "code", filters = list(time = 2050), time_format = "num")
#dat2050 = filter(dat2050, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2050 = filter(dat2050, sex == "T")
# Rok 2060
#dat2060 = get_eurostat("tps00002", type = "code", filters = list(time = 2060), time_format = "num")
#dat2060 = filter(dat2060, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2060 = filter(dat2060, sex == "T")
# Rok 2070
#dat2070 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
#dat2070 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2070 = filter(dat2020, sex == "T")
# Rok 2080
#dat2080 = get_eurostat("tps00002", type = "code", filters = list(time = 2080), time_format = "num")
#dat2080 = filter(dat2080, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2080 = filter(dat2080, sex == "T")
# Rok 2090
#dat2090 = get_eurostat("tps00002", type = "code", filters = list(time = 2090), time_format = "num")
#dat2090 = filter(dat2090, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2090 = filter(dat2090, sex == "T")
# Rok 2100
#dat2100 = get_eurostat("tps00002", type = "code", filters = list(time = 2100), time_format = "num")
#dat2100 = filter(dat2100, geo != "EU27_2020", geo != "EA19", geo != "EL")
#dat2100 = filter(dat2100, sex == "T")

#########################################################







# procentowy wzrost/spadek 2020/2060
kraj_id = dat2020$geo
pop_2020 = dat2020$values
pop_2060 = dat2060$values
zmiana20_60 = round(100 - (pop_2020/pop_2060 * 100), 2)
test = data.frame(kraj_id, zmiana20_60)
sort2060 = arrange(test,(zmiana20_60))
sort2060


# wykres wzrost/spadek 2020/2060
theme_set(theme_bw())

wykres2060 = ggplot(sort2060, aes(x = reorder(`kraj_id`, zmiana20_60), 
                                  y=zmiana20_60, label=zmiana20_60)) + 
  geom_point(stat='identity', fill="black", size = 8)  +
  geom_segment(aes(y = 0, 
                   x = `kraj_id`, 
                   yend = zmiana20_60, 
                   xend = `kraj_id`), 
                color = "black") +
  geom_text(color="white", size=2) +
  labs(title="Procentowy prognozowany spadek/wzrost populacji miedzy 2020 i 2060",
       subtitle = "Prognoza dla poszczególnych krajów") + 
  coord_flip()

wykres2060


# procentowy wzrost/spadek 2020/2100
pop_2100 = dat2100$values
zmiana20_100 = round(100 - (pop_2020/pop_2100 * 100), 2)
test = data.frame(kraj_id, zmiana20_100)
sort2100 = arrange(test,(zmiana20_100))
sort2100


# wykres wzrost/spadek 2020/2100
wykres2100 = ggplot(sort2100, aes(x = reorder(`kraj_id`, zmiana20_100), 
                                  y=zmiana20_100, label=zmiana20_100)) + 
  geom_point(stat='identity', fill="black", size = 8)  +
  geom_segment(aes(y = 0, 
                   x = `kraj_id`, 
                   yend = zmiana20_100, 
                   xend = `kraj_id`), 
               color = "black") +
  geom_text(color="white", size=2) +
  labs(title="Procentowy prognozowany spadek/wzrost populacji miedzy 2020 i 2100",
       subtitle = "Prognoza dla poszczególnych krajów") + 
  coord_flip()

wykres2100


# Ogarnianie zmiany ilosci populacji w danych latach

wyciag_danych = function(x) {
  dane = get_eurostat("tps00002", type = "code", filters = list(time = x), time_format = "num")
  dane = filter(dane, geo != "EU27_2020", geo != "EA19", geo != "EL")
  dane = filter(dane, sex == "T")
  dane = pull(dane, values)
  dane = round(sum(dane) / 1000000)
}

lud = wyciag_danych(2020)
lud

ludnosc_2020 = wyciag_danych(dat2020)
ludnosc_2030 = wyciag_danych(dat2030)
ludnosc_2040 = wyciag_danych(dat2040)
ludnosc_2050 = wyciag_danych(dat2050)
ludnosc_2060 = wyciag_danych(dat2060)
ludnosc_2070 = wyciag_danych(dat2070)
ludnosc_2080 = wyciag_danych(dat2080)
ludnosc_2090 = wyciag_danych(dat2090)
ludnosc_2100 = wyciag_danych(dat2100)

Liczba_ludnosci = data.frame(Rok = c(2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100),
                             populacja = c(ludnosc_2020, ludnosc_2030,ludnosc_2040, ludnosc_2050, ludnosc_2060, ludnosc_2070, ludnosc_2080, ludnosc_2090, ludnosc_2100))

Liczba_ludnosci

# Wykres

library(ggplot2)

ggplot(Liczba_ludnosci, aes(x = Rok, y = populacja)) +
  geom_line(stat = "identity", colour = "lightblue", size = 2) +
  scale_y_continuous(limits = c(200, 600),
                     breaks = c(300, 450, 600)) +
  labs(title = "Zmiana liczby ludnosci w Europie w latach 2020-2100",
       y = "Populacja w milionach") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),  
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 18, hjust = 0.5)) +
  geom_point(aes(x = Rok, y = populacja)) + 
  geom_text(aes(label=populacja), hjust = 0.5, vjust = -1)



# Dane zbiorcze dla Polski

ogarnianie_danych_dla_Polski = function(x) {
  dane = get_eurostat("tps00002", type = "code", filters = list(time = x), time_format = "num")
  dane = filter(dane, geo != "EU27_2020", geo != "EA19", geo != "EL")
  dane = filter(dane, geo == "PL")
  dane = filter(dane, sex == "T")
  dane = pull(dane, values)
  dane = round(dane / 1000000)
}

Ludnosc_2020_Pol = ogarnianie_danych_dla_Polski(2020)
Ludnosc_2030_Pol = ogarnianie_danych_dla_Polski(2030)
Ludnosc_2040_Pol = ogarnianie_danych_dla_Polski(2040)
Ludnosc_2050_Pol = ogarnianie_danych_dla_Polski(2050)
Ludnosc_2060_Pol = ogarnianie_danych_dla_Polski(2060)
Ludnosc_2070_Pol = ogarnianie_danych_dla_Polski(2070)
Ludnosc_2080_Pol = ogarnianie_danych_dla_Polski(2080)
Ludnosc_2090_Pol = ogarnianie_danych_dla_Polski(2090)
Ludnosc_2100_Pol = ogarnianie_danych_dla_Polski(2100)

Dane_Polski = data.frame(Rok = c(2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100),
                         Populacja = c(Ludnosc_2020_Pol, Ludnosc_2030_Pol, Ludnosc_2040_Pol, Ludnosc_2050_Pol, Ludnosc_2060_Pol, Ludnosc_2070_Pol, Ludnosc_2080_Pol, Ludnosc_2090_Pol, Ludnosc_2100_Pol))

# Wykres

ggplot(Dane_Polski, aes(x = Rok, y = Populacja)) +
  geom_line(stat = "identity", colour = "lightblue", size = 2) +
  scale_y_continuous(limits = c(10, 60),
                     breaks = c(15, 30)) +
  labs(title = "Zmiana liczby ludnosci w Europie w latach 2020-2100",
       y = "Populacja w milionach") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),  
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 18, hjust = 0.5)) +
  geom_point(aes(x = Rok, y = Populacja)) + 
  geom_text(aes(label = Populacja), hjust = 0.5, vjust = -1)

