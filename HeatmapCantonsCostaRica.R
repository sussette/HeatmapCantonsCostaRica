#Install the libraries of spatial utilities
install.packages(c("sp", "spdep", "classInt", "maptools", "RgoogleMaps", "rgdal", "ggplot2",
                   "weights", "car", "rgl", "GeoXp","Matrix"))

#Open libraries of spatial utilities
library(sp)
library(Matrix)
library(spdep)
library(classInt)
library(maptools)
library(RgoogleMaps)
library(rgdal)
library(ggplot2)
library(weights)
library(car)
library(rgl)
library(GeoXp)

#My own working directory
#Colocar la dirección del directorio donde tienes los archivos de cantones que me enviaste.
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
datos_indice_2000 <- as.data.frame(datos_desarrollo_humano_CR[(2:82),6])
#Check it.
View(datos_indice_2000)
#name the column
names(datos_indice_2000) <- "indice_2000"


