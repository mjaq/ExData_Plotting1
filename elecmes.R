#This script exposes a function plot1() that renders the first plot.
# The function is to render the bitmapped format, PNG as plot1.png
# import data into library for hshold power




         
          library(datasets)
          x<- rnorm(100)
          y<- rnorm(100)
          
         with(hshold, plot(x,y))
         title(main = "global_active_power")
 #plot1        
         
         source('hshold power')
         plot1 <- function(){
              print('plot1.png')
           
          
              data <- getData(hsholdpower)
         }
              gap <- getData()
              
# plot to png
    png('out/plot1.png', width = 480, height = 480, bg='transparent')
    hist(gap, main = )"Global Active Power" xlab="Global Active Power(kilowatts)", col='orange')
    hist(data$Global_active_power, main="Global Active Power",
         xlab="Global Active Power(kilowatts)", col = 'orange')
    dev.off()}
    
# construct the plot
  plot1()
  
  
  
#plot2
  
      source('hshold power')
  
   plot2 <- function(pngDevice, ylab='Global Active Power (kilowatts)'){
       print('plot2')
     
       data <- getData('hshold power')
       
       gap <- data$Global_active_power
       dateTime <- paste(data$Date, data$Time, sep = '1')
       dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
   }
  
# do the plot
    
   with(data,{plot(DateTime, Global_active_power, type = '1', xlab = '', ylab = ylab)})
   
   png('out/plot2.png, width=480, height=480, bg='transparent')
   plot(dateTime, gap, type= '1'xlab= 'date', ylab = "global Active Power (kilowatts)")
   dev.off()
#discard new png to save the file
   if(pngDevice) { dev.off()
   }


#plot3

#plot a png file for plot3 into current device

     
       source('hshold power')

  plot3 <- function()
      print('Running plot2')

  plot3 <- function(pngDevice)

      print('Running plot3') dateTime <- paste(data$Date, data$Time, sep = '1')
  dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
       



      data <- getData()
  png('out/plot3.png, width=480, height=480, bg='transparent')
  
  }
  dateTime <- paste(data$Date, data$Time, sep = '1')
  dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")

  }
  png('out/plot3.png',width=480, height=480, bg='transparent')
  plot(dateTime, data$Sub_metering_1, type = 'I,xlab= 'dates', ylab="Global Active Power")
  lines(dateTime, data$Sub_metering_2, type='I', col='red')
  lines(dateTime, data$Sub_metering_3, type='I', col='blue')
  #do the plot
  with(data, {
  plot(DateTime, Sub_metering_1, type='I', xlab='Date', ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type='I', col='red')
  lines(DateTime, Sub-metering_3, type= 'I', col='blue')
  dev.off()


  })
  

  dateTime <- paste(data$Date, data$Time, sep='')
  dateTime <- strptime(dateTime, format="%d/%m/%Y%H:%M:%S")

  dir.create('out",showWarnings='F')
  
  png('out/plot3.png',width=480, height=480,bg='transparent')
  plot(dateTime,data$Sub_metering_1,type='I',xlab='Date',ylab="Energy sub metering")
  lines(dateTime,data$Sub_metering_2,type='I',col='red')
  lines(dateTime,data4Sub_metering_3,type='I',col='blue')
  #do the plot
  with(data,{
    plot(DateTime,Sub_metering_1,type='I',xlab='Date',ylab="Energy sub metering")
    lines(DateTime,Sub_metering_2,type='I',col='red')
    lines(DateTime,Sub_metering_3,type='I',col='blue')
  })
  
  dev.off()
  #if(pngDevice){
      dev.off()
  }

  -plot3()
  #since plot3.R plots the png,when this 
  #is reused in plot4.R, it re-plots plot3.
  # utility.R signals whether a plot to plot2.png should happen. plot4.R disables on its own png, but the
    plotting to plot3.png is carried out when plot3.R is called independently.
   if(!disablePlottingToFile){
       plot3(T)
   }
   plot4<-function(){
      print('Running plot4')

      data<- getData()

  #import the functions plot2() and plot3()
  #and disable plotting
  disableplottingToFile<<-F
  source('plot2.R')
  source('plot3.R')

  # function to plot Voltage vs DateTime to current device
  plotVoltage<- function(){
    with(data,{
      plot(DateTime, Voltage, xlab='datetime',type='I')
   })
  }
  
  #helper function to plot Global reactive power vs DateTime to current device
  plotGRP <- function(){
    with(data, {
      plot(DateTime, Global_reactive_power,xlab='datetime',type='I')
    })
  }
  
  #create output directory if it doesnt exist
  dir.create('out', showWarnings='F')
  #create the png.
  png('out/plot4.png',width=480,height=480,bg='transparent')

  par(mfrow=c(2,2))

  #plot the four graphs
  plot2(F,'Global Active Power')
  plotVoltage()
  plot3(F)
  plotGRP()

  #plotting complete, save the file
  dev.off()
    })
  