## Have total emissions from PM2.5 decreased in the United States from 1999 to 
## 2008? Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sum of emissions by year
sum_year <- aggregate(Emissions ~ year, data=NEI, sum)

plot(sum_year, xlab="Year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot1.png")
dev.off()