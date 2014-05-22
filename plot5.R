## How have emissions from motor vehicle sources changed from 1999¨C2008 in 
## Baltimore City?

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Dataset for Baltimore city
NEI_bal <- subset(NEI, fips=="24510") 

## emissions from motor vehicle
mot_index <- which(regexpr("Vehicles", SCC$Short.Name)>0)
mot_SCC <- SCC$SCC[mot_index]
NEI_bal_mot <- NEI_bal[NEI_bal$SCC%in%mot_SCC,]

## Split sum by years and plot
emi_veh <- aggregate(Emissions ~ year, data=NEI_bal_mot, sum)
plot(emi_veh, xlab="year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change by Vehicle in Baltimore", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot5.png")
dev.off()


