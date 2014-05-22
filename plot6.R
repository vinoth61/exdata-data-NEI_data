## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"
## ). Which city has seen greater changes over time in motor vehicle emissions?

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## emissions from motor vehicle
mot_index <- which(regexpr("Vehicles", SCC$Short.Name)>0)
mot_SCC <- SCC$SCC[mot_index]
NEI_mot <- NEI[NEI$SCC%in%mot_SCC,]

## emission in Baltimore City and California
NEI_city <- NEI_mot[NEI_mot$fips %in% c("24510","06037"),]

## split emissions by year and add a city column
NEI_city_year <- aggregate(Emissions ~ year + fips, data=NEI_city, sum)
NEI_city_year[NEI_city_year$fips=="24510",4] <- "Baltimore City"
NEI_city_year[NEI_city_year$fips=="06037",4] <- "California"
colnames(NEI_city_year)[4] <- "city"


library(ggplot2)
qplot(year, Emissions, data=NEI_city_year, col=city, xlab="year", 
      ylanb="PM2.5 Emission(Tons)", 
      main="Emission Change by Vehicle in Baltimore City and California")

dev.copy(png, file="plot6.png")
dev.off()