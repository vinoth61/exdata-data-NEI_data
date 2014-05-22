## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999¨C2008?

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Find which SCC are corresponding to Coal
coal_rel_index <- which(regexpr("Coal", SCC$Short.Name)>0)
coal_rel_SCC <- SCC$SCC[coal_rel_index]
NEI_coal_rel <- NEI[NEI$SCC%in%coal_rel_SCC,]

## Split sum by years and plot
emi_by_coal <- aggregate(Emissions ~ year, data=NEI_coal_rel, sum)
plot(emi_by_coal, xlab="Year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change by Coal", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot4.png")
dev.off()
