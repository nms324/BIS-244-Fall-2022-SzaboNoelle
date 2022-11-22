install.packages("patchwork")
library(patchwork)
WOT<-read.csv("WOT.csv")
library(dplyr)
#Battles greater than 3 , not equal to 3: -5
BattlesPlayed3GamesMoreOn<- WOT %>%filter(Battles >=4)

BattlesPlayed3GamesMoreOn$WR<- as.numeric(gsub("%","",BattlesPlayed3GamesMoreOn$WR, fixed=TRUE))

library(tidyverse)

#Used the wrong dataset for the plot : -5
PlotA <- ggplot(data=BattlesPlayed3GamesMoreOn, mapping= aes(x=reorder(Nation, WR, na.rm=TRUE), y=WR))+ 
  labs(x="Nation Played", y= "Win Rate", title= "Stats by Nation Played")+ geom_boxplot()

PlotB <- ggplot(data=BattlesPlayed3GamesMoreOn, mapping= aes(x=reorder(Class, WR, na.rm=TRUE), y=WR))+ 
  labs(x= "Type Played", y= "Win Rate", title= "Stats By Type Played") +
  geom_boxplot()


PlotA+PlotB

install.packages("gridExtra")
gridExtra::grid.arrange(PlotA, PlotB) + 
  ncol=2
