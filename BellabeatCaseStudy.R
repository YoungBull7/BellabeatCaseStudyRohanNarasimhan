install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")

library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)

head(dailyActivity_merged)
colnames(dailyActivity_merged)
summary(dailyActivity_merged)
head(sleepDay_merged)
colnames(sleepDay_merged)
summary(sleepDay_merged)

n_distinct(dailyActivity_merged$Id)
n_distinct(sleepDay_merged$Id)

dailyActivity_merged <- dailyActivity_merged %>%
  distinct() %>%
  drop_na()
sleepDay_merged <- sleepDay_merged %>%
  distinct() %>%
  drop_na()

sum(duplicated(dailyActivity_merged))
sum(duplicated(sleepDay_merged))
sum(is.na(dailyActivity_merged))
sum(is.na(sleepDay_merged))

colnames(dailyActivity_merged)
colnames(sleepDay_merged)
str(dailyActivity_merged)
str(sleepDay_merged)

dailyActivity_merged %>%  
  select(TotalSteps,
         TotalDistance,
         VeryActiveMinutes,
         FairlyActiveMinutes,
         LightlyActiveMinutes,
         SedentaryMinutes,
         Calories) %>%
  summary()

sleepDay_merged %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()

ggplot(data=dailyActivity_merged, aes(x=SedentaryMinutes, y=TotalSteps, color = Id)) + geom_point(size = 2) + geom_jitter()+ labs(title = "Total Steps Taken in a Day vs. Sedentary Minutes") + theme(plot.title = element_text(size = 13, face = "bold", hjust = 0.5))
ggplot(data=dailyActivity_merged, aes(x=SedentaryMinutes, y=TotalSteps)) + geom_histogram(stat = "identity", fill='darkblue') +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Total Steps Taken in a Day vs. Sedentary Minutes")

ggplot(data=sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point() + geom_smooth(method = "lm") + labs(title = "Total Minutes Asleep\n vs. Total Time in Bed") + theme(plot.title = element_text(size = 13, face = "bold", hjust = 0.5))
ggplot(data=sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_histogram(stat = "identity", fill='darkblue') +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Total Minutes Asleep vs. Total Time in Bed")

ggplot(data=dailyActivity_merged, aes(x=TotalSteps, y=Calories)) + geom_point() + geom_smooth(method = "lm") + labs(title = "Total Steps\n vs. Calories Burned") + theme(plot.title = element_text(size = 13, face = "bold", hjust = 0.5))
ggplot(data=dailyActivity_merged, aes(x=TotalSteps, y=Calories)) + geom_histogram(stat = "identity", fill='darkblue') +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Total Steps vs. Calories Burned")














