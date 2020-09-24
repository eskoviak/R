state = 'Minnesota'

# Load the data set and tidy up
library(readr)
confirmedDF = read_csv("d:/source/repos/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_us.csv")
deathsDF = read_csv("d:/source/repos/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_us.csv")
df <- data.frame(
  datesV = as.Date(names(confirmedDF[,-(1:11)]), "%m/%d/%y"),
  mnC = mapply(sum, confirmedDF[(confirmedDF$Province_State == state), -(1:11)]),
  mnD = mapply(sum, deathsDF[(deathsDF$Province_State == state), -(1:12)])
)
population = mapply(sum, deathsDF[(deathsDF$Province_State == state), "Population" ])


library(ggplot2)

ggplot() +
  geom_point(data = df,
  aes(datesV, mnC), colour='blue') +
  geom_point(data = df,
  aes(datesV, mnD), colour='red') +
  labs(x="Date", y="Cases") +
  scale_x_date(date_breaks = "1 month", date_labels = "%m") +
  scale_x_date(date_minor_breaks = "1 week")

#ggplot(confirmedDF[(confirmedDF$Province_State == 'Minnesota'), -(1:11)]) 
#deathDF = read.csv("d:/source/repos/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_us.csv")

