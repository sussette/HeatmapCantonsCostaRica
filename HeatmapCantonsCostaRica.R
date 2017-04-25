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

plot(cantones)

