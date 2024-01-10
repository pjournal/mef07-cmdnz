library(readxl)
library(dplyr)
library(ggplot2)

emotion <-read_excel("datas/1-vdym-ilce-baznda-hanelerdeki-duygu-durum-istatistikleri.xlsx")

# colums
names(emotion)
area <- emotion$`İlçe` %>%
    as.factor()
# ordered by "Mutluluk_Çok Fazla"
area <- reorder(area, -emotion$`Mutluluk_Çok Fazla`)
# plot
ggplot(emotion, aes(x = area, y = `Mutluluk_Çok Fazla`)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    coord_flip() +
    labs(title = "Mutluluk_Çok Fazla", x = "İlçe", y = "Sayı") +
    theme(plot.title = element_text(hjust = 0.5))

area  <- reorder(area, -emotion$`Mutluluk_Çok Az`)
#plot
ggplot(emotion, aes(x = area, y = `Mutluluk_Çok Az`)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    coord_flip() +
    labs(title = "Mutluluk_Çok Az", x = "İlçe", y = "Sayı") +
    theme(plot.title = element_text(hjust = 0.5))
