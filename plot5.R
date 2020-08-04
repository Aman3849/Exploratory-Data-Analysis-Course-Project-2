library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VehiclesLog<-grepl("vehicle", SCC$SCC.Level.Two,ignore.case = T)
VehicleSCC<-SCC[VehiclesLog,]$SCC
VehicleNEI<-NEI[NEI$SCC %in% VehicleSCC,]

BaltVehi<-subset(VehicleNEI, fips =="24510")

png("plot5.png",width = 480,height = 480)

g<-ggplot(BaltVehi,aes(factor(year),Emissions))+ geom_bar(stat = "identity")+
    xlab("years") + ylab(expression('Total PM'[2.5]* ' Emission in Tons' ))+
    ggtitle("Total Emission in Baltimore from Vehicles")
print(g)

dev.off()
