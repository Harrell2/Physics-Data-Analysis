library(tidyverse)
library(ggplot2)

Tension = c(0.1, 0.11, 0.12, 0.13, 0.14) * 9.8
period = c(0.4, 0.357, 0.333, 0.303, 0.286)

rawTension = data.frame(Tension, period)

TensionL = 1/Tension
periodL = period^2
linearTension = data.frame(Tension, periodL)

Tension_Data = data.frame(Tension, period, TensionL, periodL)
colnames(Tension_Data) = c("Ft", "T", "1/Ft", "T^2")
view(Tension_Data)

ggplot(data = rawTension, mapping = aes(x= Tension, y = period))+
  geom_point()+
  geom_line()

ggplot(data = linearTension, mapping = aes(x= TensionL, y = periodL))+
  geom_point()+
  geom_smooth(method = lm, se = FALSE)


radius = c(0.29, 0.45, 0.5, 0.6, 0.7)
period2 = c(0.303, 0.333, 0.417, 0.456, 0.556)
rawRadius = data.frame(radius,period2)

period2L = period2^2
linearRadius = data.frame(radius, period2L)

Radius_Data = data.frame(radius, period2, radius, period2L)
colnames(Radius_Data) = c("R", "T", "r", "T^2")
view(Radius_Data)

ggplot(data = rawRadius, mapping = aes(x=radius, y = period2))+
  geom_point()+
  geom_line()

ggplot(data= linearRadius, mapping = aes(x= radius,y= period2L))+
  geom_point()+
  geom_smooth(method = lm, se = FALSE)
