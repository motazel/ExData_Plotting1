setwd("C:\\Users\\motazel\\OneDrive\\Documents\\Courses\\DataScienceJHUCoursera\\ExploratoryData_Course\\Project1\\ExData_Plotting2")

library(dplyr)
#read data from file "household_power_consumption.txt"
library(lubridate)

#exdata_data_household_power_consumption <- read.csv("exdata_data_household_power_consumption\\household_power_consumption.txt")
exdata_data_household_power_consumption = read.table("..\\..\\exdata_data_household_power_consumption\\household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

# column variables are as follows

#1.Date: Date in format dd/mm/yyyy 
#2.Time: time in format hh:mm:ss 
#3.Global_active_power: household global minute-averaged active power (in kilowatt) 
#4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
#5.Voltage: minute-averaged voltage (in volt) 
#6.Global_intensity: household global minute-averaged current intensity (in ampere) 
#7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
#8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
#9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


#V1   V2                  V3                    V4      V5               V6             V7             V8             V9
#Date Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3

# subsetting data between 2007-02-01 and 2007-02-02
#remove first the first wrow of variable names
exdata_data_household_power_consumption = exdata_data_household_power_consumption[2:nrow(exdata_data_household_power_consumption),]
# now: subsetting data between 2007-02-01 and 2007-02-02
tempDate = exdata_data_household_power_consumption$V1
tempDate = as.character(tempDate)

#matchingDates = ((as.Date("01/05/2007") == as.Date(tempDate)) # | (as.Date("02/02/2007") == as.Date(tempDate))
matchingDates = ("1/2/2007" == tempDate)  | ("2/2/2007" == tempDate)
exdata_data_household_power_consumption = exdata_data_household_power_consumption[matchingDates==TRUE,]



# plot Global_active_power which is V3
GlobalActivePower = as.numeric(exdata_data_household_power_consumption$V3)
DateTime = paste(exdata_data_household_power_consumption$V1, exdata_data_household_power_consumption$V2)
dates <- dmy_hms(DateTime)




# plot Global_active_power which is V3
GlobalActivePower = as.numeric(exdata_data_household_power_consumption[,3])
Sub_metering_1 = as.numeric(exdata_data_household_power_consumption[,7])
Sub_metering_2 = as.numeric(exdata_data_household_power_consumption[,8])
Sub_metering_3 = as.numeric(exdata_data_household_power_consumption[,9])





par(mfrow = c(2, 2), mar = c(4, 1.5, 2, 1.5), oma = c(2, 2, 2, 0))
with(exdata_data_household_power_consumption, {
  plot(dates, V3, xlab = "", ylab="Global Active Power",pch = 16, type ="n")
  lines(dates, V3)
  plot(dates, V5, xlab = "datetime", ylab="Voltage",pch = 16, type ="n")
  lines(dates, V5)
  plot(dates, Sub_metering_1, xlab = "", ylab="Energy sub metering", , pch = 5, type ="n")
  lines(dates, Sub_metering_1, col ="black")
  lines(dates, Sub_metering_2, col ="red")
  lines(dates, Sub_metering_3, col ="blue")
  legend("topright",col=c("black","red","blue"), lty=c(1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty ="n")
    
  plot(dates, V4, xlab = "datetime", ylab="Global_reactive_power",pch = 16, type ="n", yaxt = "n")
  axis(side=2, at = c(0,0.1,0.2,0.3,0.4,0.5), labels = TRUE )
  lines(dates, V4, col ="black")
  
  
})


dev.copy(png, file="plot4.png")
dev.off()
