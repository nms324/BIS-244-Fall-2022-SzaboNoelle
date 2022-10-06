


library(tidyverse)
library(here)
library(gapminder)
USC2020<-read.csv(here("covid-19-data","us-counties-2020.csv"))
USC2021<-read_csv(here("covid-19-data","us-counties-2021.csv"))
USC2022<-read.csv(here("covid-19-data","us-counties-2022.csv"))
USCRECENT<-read.csv(here("covid-19-data","us-counties-recent.csv"))
USLIVE<-read.csv(here("covid-19-data","live","us-counties.csv"))

DATA<-rbind(USC2020,USC2021,USC2022,USCRECENT,USLIVE)
View(DATA)

PA <- filter(DATA, state=="Pennsylvania" & county=="Lehigh")

PA<-distinct(PA,date,.keep_all = TRUE)

n<-length(PA$date)

PA$incr_cases <- 1

for (i in 2:n) {
  PA$incr_cases[i] <- (PA$cases[i]-PA$cases[i-1])}
  


p<- ggplot(data=PA)
       

p + geom_line(color="blue",mapping = aes(x=date, y=incr_cases),group=1) + 
  labs(x="Date", y= "New Cases Reported",
                                   title = "COVID-19 Cases Reported in
                                   Lehigh, PA",)
