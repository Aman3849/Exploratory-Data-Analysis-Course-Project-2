library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VehiclesLog<-grepl("vehicle", SCC$SCC.Level.Two,ignore.case = T)
VehicleSCC<-SCC[VehiclesLog,]$SCC
VehicleNEI<-NEI[NEI$SCC %in% VehicleSCC,]

BaltVehi<-subset(VehicleNEI, fips =="24510")
LaVehi<-subset(VehicleNEI, fips =="06037")

BaltVehi$city<-"Baltimore, Maryland"
LaVehi$city<-"Los Angeles, CA"

data<-rbind(LaVehi,BaltVehi)

png("plot6.png", width = 1440, height= 480)

g<-ggplot(data, aes(factor(year), Emissions))+ geom_bar(aes(fill = year),stat = "identity")+ facet_grid(.~city)+
    xlab("years") + ylab(expression('Total PM'[2.5]* ' Emission in Tons' ))+
    ggtitle("Total Emission in Baltimore and Los Angeles from motor Vehicles")
print(g)

dev.off()