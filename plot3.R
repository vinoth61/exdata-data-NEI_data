## Of the four types of sources indicated by the type (point, nonpoint, onroad, 
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999¨C2008 for Baltimore City? Which have seen increases in 
## emissions from 1999¨C2008? Use the ggplot2 plotting system to make a plot 
## answer this question.

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_bal <- subset(NEI, fips=="24510") ## Dataset for Baltimore city

## Split sum by years and plot
sum_year_bal <- aggregate(Emissions ~ year + type, data=NEI_bal, sum)

library(ggplot2)
qplot(year, Emissions, data=sum_year_bal, facets=type~., binwidth=2, 
      xlab="year", ylab="PM2.5 Emission(Tons)", 
      main="Total Emission Change in Baltimore by Type")

dev.copy(png,file="plot3.png")
dev.off()