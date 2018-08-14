#!/usr/bin/env Rscript

dataset <- read.csv("capture.csv", sep=";", header=FALSE)

#           1       2           3           4           5           6           7       8       9           10      11          12
#labels = c("time", "TempLM35", "TempBMP", "Pressure", "Altitude", "TempMPU", "Acc.x", "Acc.y", "Acc.z", "Gyro.x", "Gyro.y", "Gyro.z")

png(filename="temperature_relation.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V2, col="red", type="l", ylab="Temperature in °C", xlab="Time in msec")
par(new=TRUE)
plot(x=dataset$V1, y=dataset$V3, col="green", type="l", ylab="", xlab="")
dev.off()

png(filename="temperature_LM35.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V2, type="l", ylab="Temperature in °C (LM35)", xlab="Time in msec")
dev.off()

png(filename="temperature_BMP.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V3, type="l", ylab="Temperature in °C (BMP)", xlab="Time in msec")
dev.off()

png(filename="altitude_accel_relation.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V5, col="red", type="l", ylab="Altitude in m", xlab="Time in msec")
par(new=TRUE)
plot(x=dataset$V1, y=dataset$V9, col="green", type="l", ylab="Accel in m/s", xlab="Time in msec")
dev.off()

png(filename="altitude.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V5, type="l", ylab="Altitude in m", xlab="Time in msec")
dev.off()

png(filename="acceleration.png", 
    type="cairo",
    units="in", 
    width=25,
    height=8, 
    pointsize=23, 
    res=96)
par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
plot(x=dataset$V1, y=dataset$V8, type="l", ylab="Acceleration in m/s (y-axis)", xlab="Time in msec")
dev.off()

#dataset = list(cts, rts, blockack, beacon, prores, qosdata) 
#labels = c("CTS", "RTS", "Block", "Beacon", "ProbRes", "QoSData")
#amount <- lapply(dataset,length)
#amount = unlist(amount)
#
#png(filename=paste0(args[1],"/barAmount.png"), 
#    type="cairo",
#    units="in", 
#    width=12,
#    height=8, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
#barplot(amount/1000, legend=TRUE, names=labels, ylab="Number of frames (thousand)")
#dev.off()
#
#dataset = list(cts, rts, blockack, beacon, prores) 
#labels = c("CTS", "RTS", "Block", "Beacon", "ProbRes")
#amount <- lapply(dataset,length)
#amount = unlist(amount)
#
#png(filename=paste0(args[1],"/barAmountNoData.png"), 
#    type="cairo",
#    units="in", 
#    width=12,
#    height=10, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
#barplot(amount/1000, legend=TRUE, names=labels, ylab="Number of frames (thousand)")
#dev.off()
#
#### #######################################################
#### Single Frame Size
#### #######################################################
#
#dataset = list(cts, rts, blockack, ack, beacon, prores, proreq, qosdata, data) 
#labels = c("CTS", "RTS", "Block", "Ack", "Beacon", "ProbRes", "ProbReq", "QoSData", "Data")
#
#png(filename=paste0(args[1],"/boxSizeAll.png"),
#    type="cairo",
#    units="in", 
#    width=17,
#    height=10, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1.5,1.5,0.5,0.5),omi=c(0,0,0,0))
#boxplot(las=1, ylab="Size (bytes)", dataset, names=labels)
#dev.off()
#
#dataset = list(cts, rts, blockack, ack, beacon, prores, proreq)
#labels = c("CTS", "RTS", "Block", "Ack", "Beacon", "ProbRes", "ProbReq")
#
#png(filename=paste0(args[1],"/boxSizeAllNoData.png"),
#    type="cairo",
#    units="in", 
#    width=16,
#    height=8, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1.5,1.5,0.5,0.5),omi=c(0,0,0,0))
#boxplot(las=1, ylab="Size (bytes)", dataset, names=labels)
#dev.off()
#
#dataset = list(cts, rts, beacon, prores, qosdata) 
#labels = c("CTS", "RTS", "Beacon", "ProbRes", "QoSData")
#
#png(filename=paste0(args[1],"/boxSize.png"),
#    type="cairo",
#    units="in", 
#    width=10,
#    height=8, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1.5,1.5,0.5,0.5),omi=c(0,0,0,0))
#boxplot(las=1, ylab="Size (bytes)", dataset, names=labels)
#dev.off()
#
#dataset = list(cts, rts, beacon, prores)
#labels = c("CTS", "RTS", "Beacon", "ProbRes")
#
#png(filename=paste0(args[1],"/boxSizeNoData.png"),
#    type="cairo",
#    units="in", 
#    width=10,
#    height=8, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1.5,1.5,0.5,0.5),omi=c(0,0,0,0))
#boxplot(las=1, ylab="Size (bytes)", dataset, names=labels)
#dev.off()
#
#### #######################################################
#### Total Size
#### #######################################################
#
#dataset = list(cts, rts, blockack, ack, beacon, prores, proreq, qosdata, data) 
#labels = c("CTS", "RTS", "Block", "Ack", "Beacon", "ProbRes", "ProbReq", "QoSData", "Data")
#size <- lapply(dataset,sum)
#size = unlist(size)
#
#png(filename=paste0(args[1],"/barFullsizeAll.png"), 
#    type="cairo",
#    units="in", 
#    width=17,
#    height=10, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
#barplot(size/1000000, legend=TRUE, names=labels, ylab="Size in total (mbytes)", xlab="Frame")
#dev.off()
#
#dataset = list(cts, rts, blockack, beacon, prores, qosdata) 
#labels = c("CTS", "RTS", "Block", "Beacon", "ProbRes", "QoSData")
#size <- lapply(dataset,sum)
#size = unlist(size)
#
#png(filename=paste0(args[1],"/barFullsize.png"), 
#    type="cairo",
#    units="in", 
#    width=12,
#    height=8, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
#barplot(size/1000000, legend=TRUE, names=labels, ylab="Size in total (mbytes)", xlab="Frame")
#dev.off()
#
#dataset = list(cts, rts, blockack, beacon, prores) 
#labels = c("CTS", "RTS", "Block", "Beacon", "ProbRes")
#size <- lapply(dataset,sum)
#size = unlist(size)
#sizeKis = lapply(dataset, "+", 50)
#sizeKis = lapply(sizeKis,sum)
#sizeKis = unlist(sizeKis)
#
#png(filename=paste0(args[1],"/barFullsizeNoDataKismet.png"), 
#    type="cairo",
#    units="in", 
#    width=12,
#    height=10, 
#    pointsize=23, 
#    res=96)
#par(mai=c(1,1.5,0.5,0.5),omi=c(0,0,0,0))
#barplot(t(data.frame(size/1000000,sizeKis/1000000)),beside=T, legend=c("Total Size", "Total Size with Overhead"), names=labels, ylab="Size (mbytes)")
#dev.off()
#
