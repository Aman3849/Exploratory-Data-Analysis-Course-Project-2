library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustion<-grepl("comb",SCC$SCC.Level.One,ignore.case = TRUE)
coal<-grepl("coal",SCC$SCC.Level.Four,ignore.case = TRUE)

CoalCombSCC<-SCC[combustion&coal, ]$SCC
CoalCombNEi<-NEI[NEI$SCC %in% CoalCombSCC,]

png("plot4.png",width = 480,height = 480)

g<-ggplot(CoalCombNEi,aes(factor(year), Emissions)) +
    geom_bar(stat = "identity")+xlab("years") + ylab(expression('Total PM'[2.5]* ' Emission in Tons' ))+
    ggtitle("Total Emission from Coal")
print(g)

dev.off()

