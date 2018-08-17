#!/usr/bin/env Rscript

if (length(args)==1) {
    custom_start = TRUE
    #stop("At least one argument must be supplied (name of folder).n", call.=FALSE)
} else {
    custom_start = FALSE
}

dataset <- read.csv("capture.csv", sep=";", header=FALSE)

#           1       2           3           4           5           6           7       8       9           10      11          12
#labels = c("time", "TempLM35", "TempBMP", "Pressure", "Altitude", "TempMPU", "Acc.x", "Acc.y", "Acc.z", "Gyro.x", "Gyro.y", "Gyro.z")

time <- dataset$V1 - min(dataset$V1)

png(filename="temperature_relation.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time,y=dataset$V2,type="l", xaxt="n", yaxt="n", xlab="", ylab="", bty="n")
axis(side=1, col="black", lty="solid")
axis(side=2, col="black", lty="solid")
zfactor <- max(abs(dataset$V2))/max(abs(dataset$V3))
zskal <- zfactor * dataset$V3
lines(x=time, y=zskal)
dev.off()

png(filename="temperature_LM35.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time, y=dataset$V2, type="l", ylab="Temperature in °C (LM35)", xlab="Time in msec")
dev.off()

png(filename="temperature_BMP.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time, y=dataset$V3, type="l", ylab="Temperature in °C (BMP)", xlab="Time in msec")
dev.off()

png(filename="altitude_accel_relation.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time,y=(dataset$V5-min(dataset$V5)),type="l", xaxt="n", yaxt="n", xlab="", ylab="", bty="n")
axis(side=1, col="black", lty="solid")
axis(side=2, col="black", lty="solid", at=seq(0, max(dataset$V5-min(dataset$V5)), 10))
zfactor <- max(abs(dataset$V5))/max(abs(dataset$V8))
zskal <- (zfactor * dataset$V8)
lines(x=time, y=zskal)
dev.off()

png(filename="altitude.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time, y=(dataset$V5-min(dataset$V5)), type="l", ylab="Altitude in m", xlab="Time in msec")
dev.off()

png(filename="acceleration.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=time, y=dataset$V8, type="l", ylab="Acceleration in m/s (y-axis)", xlab="Time in msec")
dev.off()
