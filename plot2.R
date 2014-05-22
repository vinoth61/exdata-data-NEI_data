## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
## (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
## plot answering this question.

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_bal <- subset(NEI, fips=="24510") ## Dataset for Baltimore city

## Split sum by years and plot
sum_year_bal <- aggregate(Emissions ~ year, data=NEI_bal, sum)

plot(sum_year_bal, xlab="Year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change in Baltimore", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot2.png")
dev.off()