library(ggplot2)
library(reshape)

survey <- read.csv("data/surveyResults.csv",header=TRUE)

df <- melt(survey, measure.vars = c(20,21,22))
df$variable <- factor(df$variable, labels = c("Q2","Q3","Q4"))
df$variable <- factor(df$variable, c("Q3", "Q4", "Q2"))
df <- cast(df, variable + value ~ ., length)
df$all <- df[,"(all)"]
df$value <- factor(df$value, c("85","120","150","Unlimited"))
print(ggplot(df, aes(x = value, weight = all, fill = variable)) + geom_bar(position = "dodge"))
