NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalByYear<-aggregate(Emissions~year,NEI,sum)

png('plot1.png')

barplot(height = TotalByYear$Emissions/10^6,names.arg = TotalByYear$year,col = TotalByYear$year,
        xlab = "years",ylab =expression('Total PM'[2.5]* ' Emission ( 10^6 Tons)') ,
        main = expression('PM' [2.5]* ' Across The Years'))

dev.off()