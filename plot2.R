NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltNei<-subset(NEI, fips == '24510')
BaltTotalByYear<-aggregate(Emissions~year,BaltNei,sum)

png('plot2.png')

barplot(height = BaltTotalByYear$Emissions,names.arg = BaltTotalByYear$year,col = BaltTotalByYear$year, xlab = "years",ylab =expression('Total PM'[2.5]* ' Emission in Tons' ) , main = expression('PM' [2.5]* ' Emission from Baltimore over the years '))

dev.off()