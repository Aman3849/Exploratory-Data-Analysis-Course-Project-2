library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltNei<-subset(NEI, fips == '24510')
SubBaltNei<-aggregate(Emissions~year + type, BaltNei,sum)

png("plot3.png",width = 720,height = 480)

g<-ggplot(SubBaltNei,aes(year,Emissions,color = type))
g<-g + geom_line() + xlab("years") + ylab(expression('Total PM'[2.5]* ' Emission in Tons' ))+
    ggtitle("Emissions in Baltimore City at different sources")
print(g)

dev.off()