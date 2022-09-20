
#correct way to read csv for future reference
US <- read.csv(here("covid-19-data","us-states.csv")) 

#Try to reduce redundant code
US<-read.csv("us-states.csv")
View(US)
library(tidyverse)
#filter(US,states=="Pennsylvania")
#filter(US, state=="Pennsylvania")
#view("Pennsylvania")
#view(Pennsylvania)
PENNSYLVANIA<-filter(US, state=="Pennsylvania")
view(PENNSYLVANIA)
n <- length(PENNSYLVANIA$date)
PENNSYLVANIA$incr_cases <- 1
#view(PENNSYLVANIA)
#PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1])

for (i in 2:n) {
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1])
}
#View(PENNSYLVANIA)
PENNSYLVANIA$incr_deaths <- 1
view(PENNSYLVANIA)
for (i in 2:n) {
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i]-PENNSYLVANIA$deaths[i-1])
}
#View(PENNSYLVANIA)
sd(PENNSYLVANIA$incr_cases,n)
