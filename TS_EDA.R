#MODELO COMPLETO

library(data.table) #Data wrangling
library(lubridate) #manage dates
library(tseries) #manage time series
library(ggplot2) #plotting
library(ggfortify) #enhances ggplot
library(forecast)

#Load Data
ds<- fread("demanda_MwH.csv")

#1. First Glance
head(ds)
str(ds)
summary(ds)

start_y= 2012 #Starting Year

#2. Set the data as time series and specify it's monthly data

ts.data<- ts(energy_dem$energy_demand, start = c(start_y,1), frequency = 12)
autoplot(ts.data, colour = "blue", ylab = "Energy Demand", main = "Residential Energy Demand")


#Trend, seasonality and remainder
components<-decompose(ts.data)
autoplot(components)

#Descriptive
eda(ts.data)

#Autocorrelation
ggAcf(ts.data, main="Autocorrelation")

