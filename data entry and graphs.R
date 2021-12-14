library(tidyverse)
library(readxl)
baseline <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "BASELINE")
exp1 <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "9_7_21")
exp2 <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "9_9_21")
exp3 <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "9_13_21")
exp4 <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "9_20_21")
exp5 <- read_excel("FreeFlyerDataTwoManTentsNewEntranceDevices.xlsx", sheet = "10_5_21")



df <- full_join(baseline, exp1)
df <- full_join(df, exp2)
df <- full_join(df, exp3)
df <- full_join(df, exp4)
df <- full_join(df, exp5)
df %>% 
  filter(treatment != "baseline") %>% 
  filter(Location != 'SE_2_east') %>% 
  ggplot(aes(treatment, recaptured, fill = species)) +
  geom_bar(position = 'dodge', stat = "identity") + 
  
  scale_fill_grey() 

df %>% 
  ggplot(aes(treatment, recaptured, fill = species)) +
  geom_bar(position = 'dodge', stat = 'identity') + 
  facet_wrap(~date) + 
  scale_fill_grey() 

df %>% 
  ggplot(aes(date, recaptured, fill = species)) +
  geom_bar(position = 'dodge', stat = 'identity') + 
  facet_grid(.~Location) + 
  scale_fill_grey() + 
  scale_x_date(date_labels = "%m/%d", breaks = "1 day")
  

df$date <- as.Date(df$date)

df %>% 
  filter(treatment != "baseline") %>% 
  filter(Location != 'SE_2_east')


