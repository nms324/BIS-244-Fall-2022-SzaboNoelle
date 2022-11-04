install.packages("patchwork")
library(patchwork)
WOT<-read.csv("WOT (3).csv")
library(dplyr)
BattlesPlayed3GamesMoreOn<- WOT %>%filter(Battles >= 3)

WOT$WR<- as.numeric(gsub("%","",WOT$WR, fixed=TRUE))

library(tidyverse)


PlotA <- ggplot(data=WOT, mapping= aes(x=reorder(Nation, WR, na.rm=TRUE), y=WR))+ 
  labs(x="Nation Played", y= "Win Rate", title= "Stats by Nation Played")+ geom_boxplot()

PlotB <- ggplot(data=WOT, mapping= aes(x=reorder(Class, WR, na.rm=TRUE), y=WR))+ 
  labs(x= "Type Played", y= "Win Rate", title= "Stats By Type Played") +
  geom_boxplot()


install.packages("gridExtra")
gridExtra::grid.arrange(PlotA, PlotB) + 
  ncol=2
