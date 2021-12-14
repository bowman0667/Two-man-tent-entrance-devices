df <- HoopCageKnockdownDataTwoManTents

library(tidyverse)

df$date <- as.Date(df$date) 

str(df)

df$time <- factor(df$time, levels = c('15m', '30m', '45m', '1hr', "2hr",  "3hr", 
                                         "4hr", "24hr"))

df %>% 
  ggplot(aes(treatment,knockDownCount, fill = location)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  facet_wrap(~date + time) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer()



df %>% 
  group_by(location, treatment) %>% 
  summarize('mean knockdowns'  = mean(knockDownCount), "standard error" =  std_err(knockDownCount))  %>% 
  kbl() %>% 
  kable_classic_2(full_width = F) 


std_err <- function(x){
  x <- sd(x)/sqrt(length(x))
}

length(y)
sqrt(length(y))
mean(y)

#testing the git hub

y = c(12,23,10,5)

E <- std_err(y)

library(kableExtra)
library(webshot)
