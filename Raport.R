
# Wczytanie bazy danych

library(eurostat)
library(dplyr)
library(ggplot2)
library(cowplot)
library(magick)

# dane

get_data_gen = function(x) {
  dane = get_eurostat("tps00002", type = "code", filters = list(time = x), time_format = "num")
  dane = filter(dane, geo != "EU27_2020", geo != "EA19", geo != "EL")
  dane = filter(dane, sex == "T")
  dane = dane$values
}

pop_2020 = get_data_gen(2020)
pop_2030 = get_data_gen(2030)
pop_2040 = get_data_gen(2040)
pop_2050 = get_data_gen(2050)
pop_2060 = get_data_gen(2060)
pop_2070 = get_data_gen(2070)
pop_2080 = get_data_gen(2080)
pop_2090 = get_data_gen(2090)
pop_2100 = get_data_gen(2100)

EU_2020 = sum(pop_2020)
EU_2060 = sum(pop_2060)
EU_2100 = sum(pop_2100)

# procentowy wzrost/spadek 2020/2060
dat2020 = get_eurostat("tps00002", type = "code", filters = list(time = 2020), time_format = "num")
dat2020 = filter(dat2020, geo != "EU27_2020", geo != "EA19", geo != "EL")
dat2020 = filter(dat2020, sex == "T")
kraj_id = dat2020$geo
zmiana20_60 = round(100 - (pop_2020/pop_2060 * 100), 2)
tempo_zmian = data.frame(kraj_id, zmiana20_60)
sort2060 = arrange(tempo_zmian,(zmiana20_60))
sort2060
EU_20_60 = 100 - (EU_2060 / EU_2020 * 100)
EU_20_60


# wykres wzrost/spadek 2020/2060

wykres2060 = ggplot(sort2060, aes(x = reorder(`kraj_id`, zmiana20_60), 
                                  y=zmiana20_60, label = zmiana20_60)) + 
  geom_point(stat='identity', fill="black", size = 8)  +
  geom_segment(aes(y = 0, 
                   x = `kraj_id`, 
                   yend = zmiana20_60, 
                   xend = `kraj_id`), 
                color = "black") +
  geom_text(color="white", size = 2) +
  labs(title = "Procentowy prognozowany spadek/wzrost populacji miedzy 2020 i 2060",
       subtitle = "Prognoza dla poszczególnych krajów",
       y = "Procentowy wskaznik dynamiki zmian",
       x = "") +
  theme(axis.text.y = element_blank(),
        plot.background = element_rect(fill = "grey90")) +
  coord_flip()

a = 2.90
icons = axis_canvas(wykres2060, axis = "y") +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Latvia.svg/125px-Flag_of_Latvia.svg.png", y = -52.3, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Lithuania.svg/125px-Flag_of_Lithuania.svg.png", y = -49.5, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Romania.svg/125px-Flag_of_Romania.svg.png", y = -52.3 + 2*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Bulgaria.svg/125px-Flag_of_Bulgaria.svg.png", y = -52.3 + 3*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/125px-Flag_of_Croatia.svg.png", y = -52.3 + 4*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/125px-Flag_of_Poland.svg.png", y = -52.3 + 5*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/125px-Flag_of_Portugal.svg.png", y = -52.3 + 6*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Slovakia.svg/125px-Flag_of_Slovakia.svg.png", y = -52.3 + 7*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Estonia.svg/125px-Flag_of_Estonia.svg.png", y = -52.3 + 8*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/125px-Flag_of_Italy.svg.png", y = -52.3 + 9*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/125px-Flag_of_Finland.svg.png", y = -52.3 + 10*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/125px-Flag_of_Hungary.svg.png", y = -52.3 + 11*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Slovenia.svg/125px-Flag_of_Slovenia.svg.png", y = -52.3 + 12*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_Czech_Republic.svg/240px-Flag_of_the_Czech_Republic.svg.png", y = -52.3 + 13*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/125px-Flag_of_Germany.svg.png", y = -52.3 + 14*a, scale = 2, width = 0.7, height = 0.7) +     
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/125px-Flag_of_Spain.svg.png", y = -52.3 + 15*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Belgium.svg/125px-Flag_of_Belgium.svg.png", y = -52.3 + 16*a, scale = 2, width = 0.7, height = 0.85) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/125px-Flag_of_the_Netherlands.svg.png", y = -52.3 + 17*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/125px-Flag_of_France.svg.png", y = -52.3 + 18*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/125px-Flag_of_Austria.svg.png", y = -52.3 + 19*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/125px-Flag_of_Denmark.svg.png", y = -52.3 + 20*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Flag_of_Liechtenstein.svg/125px-Flag_of_Liechtenstein.svg.png", y = -52.3 + 21*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/125px-Flag_of_Switzerland.svg.png", y = -52.3 + 22*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Cyprus.svg/125px-Flag_of_Cyprus.svg.png", y = -52.3 + 23*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/125px-Flag_of_Norway.svg.png", y = -52.3 + 24*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/125px-Flag_of_Sweden.svg.png", y = -52.3 + 25*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flag_of_Luxembourg.svg/125px-Flag_of_Luxembourg.svg.png", y = -52.3 + 26*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Flag_of_Ireland.svg/125px-Flag_of_Ireland.svg.png", y = -52.3 + 27*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Malta.svg/125px-Flag_of_Malta.svg.png", y = -52.3 + 28*a, scale = 2, width = 0.7, height = 0.7) +
  draw_image("https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Iceland.svg/125px-Flag_of_Iceland.svg.png", y = -52.3 + 29*a, scale = 2, width = 0.7, height = 0.7) 
(wykres2060 = ggdraw(insert_yaxis_grob(wykres2060, icons, position = "left")))



# procentowy wzrost/spadek 2020/2100

zmiana20_100 = round(100 - (pop_2020/pop_2100 * 100), 2)
test = data.frame(kraj_id, zmiana20_100)
sort2100 = arrange(test,(zmiana20_100))
sort2100

# dla calej Europy


EU_20_21 = 100 - (EU_2100 / EU_2020 * 100)
EU_20_21

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


###### odchylenie standardowe procentowego wzrostu/spadku

odchylenie = function(rok_a, rok_b) {
  zmiana = round(100 - (rok_a / rok_b * 100), 2)
  okragl = sd(zmiana)
  odchylenie = round(okragl, 2)
  return(odchylenie)
}
od_st_2030 = odchylenie(pop_2020, pop_2030)
od_st_2040 = odchylenie(pop_2030, pop_2040)
od_st_2050 = odchylenie(pop_2040, pop_2050)
od_st_2060 = odchylenie(pop_2050, pop_2060)
od_st_2070 = odchylenie(pop_2060, pop_2070)
od_st_2080 = odchylenie(pop_2070, pop_2080)
od_st_2090 = odchylenie(pop_2080, pop_2090)
od_st_2100 = odchylenie(pop_2090, pop_2100)





## wykres

odchylenie_ramka = data.frame(Rok = c(2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100),
                              od_dla_lat = c(od_st_2030, od_st_2040, od_st_2050, od_st_2060,
                                             od_st_2070, od_st_2080, od_st_2090, od_st_2100))

ggplot(odchylenie_ramka, aes(x = Rok, y = od_dla_lat)) +
  geom_line(stat = "identity", colour = "lightblue", size = 2) +
  scale_y_continuous(limits = c(0, 10),
                     breaks = c(2, 4, 6)) +
  labs(title = "Zmiana odchylenia standardowego procentowego wzrostu/spadku",
       y = "Odchylenie standardowe procentowego wzrostu/spadku") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),  
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.title = element_text(size = 12),
        plot.title = element_text(size = 18, hjust = 0.5)) +
  geom_point(aes(x = Rok, y = od_dla_lat)) + 
  geom_text(aes(label = od_dla_lat), hjust = 0.5, vjust = -1)                              


## odchylenie standardowe procentowego wzrostu/spadku systematycznie spada co oznacza, ze
## różnice wartosci procentowego wzrostu/spadku dla wszystkich krajów zmniejszaja sie, a co 
## za tym idzie, jesli tendencja spadkowa utrzyma sie, os bedzie dazylo do 0 oraz sytuacja w 
## przestanie sie tak gwaltownie zmieniac i zachdzace zmiany nie beda juz tak znaczace jak
## w poprzednim stuleciu



############### Ogarnianie zmiany ilosci populacji w danych latach

wyciag_danych = function(x) {
  dane = get_eurostat("tps00002", type = "code", filters = list(time = x), time_format = "num")
  dane = filter(dane, geo != "EU27_2020", geo != "EA19", geo != "EL")
  dane = filter(dane, sex == "T")
  dane = pull(dane, values)
  dane = round(sum(dane) / 1000000)
}

ludnosc_2020 = wyciag_danych(2020)
ludnosc_2030 = wyciag_danych(2030)
ludnosc_2040 = wyciag_danych(2040)
ludnosc_2050 = wyciag_danych(2050)
ludnosc_2060 = wyciag_danych(2060)
ludnosc_2070 = wyciag_danych(2070)
ludnosc_2080 = wyciag_danych(2080)
ludnosc_2090 = wyciag_danych(2090)
ludnosc_2100 = wyciag_danych(2100)

Liczba_ludnosci = data.frame(Rok = c(2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100),
                             populacja = c(ludnosc_2020, ludnosc_2030,ludnosc_2040, ludnosc_2050, ludnosc_2060, ludnosc_2070, ludnosc_2080, ludnosc_2090, ludnosc_2100))

Liczba_ludnosci

# Wykres


ggplot(Liczba_ludnosci, aes(x = Rok, y = populacja)) +
  geom_line(stat = "identity", colour = "lightblue", size = 2) +
  scale_y_continuous(limits = c(300, 550),
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



########################### Dane zbiorcze dla Polski

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

