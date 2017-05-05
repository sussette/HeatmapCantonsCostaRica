#################################################################################################
#Author: Yeimi Sussette Cruz Carrillo
#Date: 04/05/2017
#Title: Heatmap of human develpment index Costa Rica

#################################################################################################
#Install the libraries of spatial utilities
#Run this command only the first time
install.packages(c("sp", "spdep", "classInt", "maptools", "RgoogleMaps", "rgdal",
                   "ggplot2","weights", "car", "rgl", "GeoXp","Matrix"))

#Clean the environment
rm(list = ls())

#Open libraries of spatial utilities
library(sp)
library(Matrix)
library(spdep)
library(classInt)
library(RColorBrewer)
library(maptools)
library(RgoogleMaps)
library(rgdal)
library(ggplot2)
library(weights)
library(car)
library(rgl)
library(GeoXp)

#My own working directory
#Use your own directory
setwd('C:/Users/Yeimi/Desktop/Trabajo R/CANTONES')
list.files()
dir()
getwd()

#get shapefile info
getinfo.shape("cantones.shp")

#Load the shapefile cantones
cantones <- readShapeSpatial("cantones.shp")

#Check info
summary(cantones)

#Draw cantons of Costa Rica
plot(cantones)

#Check cantones
#mode(cantones)

#Names of the columns
#names(cantones)

#Table cantones
View(cantones)

#Data of cantones
#cantones@data

#Amount of cantons
#length(cantones)

#Load information about human develop Costa Rica (format xlsx)
#Plot this information
library(readxl)
datos_desarrollo_humano_CR <- read_excel("C:/Users/Yeimi/Desktop/Trabajo R/datos desarrollo humano Costa Rica.xlsx")
View(datos_desarrollo_humano_CR)

#Extract the information to plot.
datos_indice_2000 <- as.data.frame(datos_desarrollo_humano_CR[(2:82),c(2,4,6)])
#Check it.
View(datos_indice_2000)
#name the column
names(datos_indice_2000) <- c("N_provincia","N_canton","indice_2000")

#Set the same amount of rows
row.names(cantones) <- row.names(datos_indice_2000)
View(cantones)

#Check that the shapefile and file have the same order of provinces and cantons, if not 
#Order the provinces  and cantons of the shapefile and the file with the information to plot.
cantones.data <- SpatialPolygonsDataFrame(cantones,datos_indice_2000)

#Convert the variable´s character class to double class to be plot it.
plotvar <- as.double(cantones.data$indice_2000)

#Colours numbers
nclr <- 5 

#Choose the amount and shade of blue.
plotclr <- brewer.pal(nclr,"Blues")

#Here, set the numbers of decimals.
class <- classIntervals(round(plotvar,3)*100,nclr,style = "quantile")

#Define the palette of colours.
colcode <- findColours(class,plotclr)

#Make an image with jpeg format.
jpeg("MapaCantonesIndiceDesarrollo.jpeg", quality = 100, height = 2400, width = 2200)

#Draw the map with the shade.
plot(cantones.data, col = colcode, border = "grey", axes = T)

#Title of the map
title(main = "Indice de desarrollo del año 2000", cex = 1)

#Brief description of the decimals parameters and your proportional color. 
legend("bottomright", legend = names(attr(colcode, "table")),
      fill = attr(colcode, "palette"), cex = 1.25)

#Finish the graphical control.
dev.off()


