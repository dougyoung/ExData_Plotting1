source('load_samples.R')
source('render_to_png.R')

source('plot2.R')
source('plot3.R')

upper_left <- plot2
upper_right <- function(samples) {
  # Line plot of Voltage given Datetime
  with(samples, {
    plot(
      samples$Voltage ~ samples$DateTime, 
      type='l', 
      xlab='datetime', 
      ylab='Voltage'
    )
  })
}
lower_left <- plot3
lower_right <- function(samples) {
  # Line plot of Global reactive power given Datetime
  with(samples, {
    plot(
      Global_reactive_power ~ samples$DateTime,
      type='l',
      xlab='datetime',
      ylab='Global_reactive_power'
    )
  })
}

plot4 <- function(samples) {
  # 2 by 2 plot
  par(mfrow=c(2,2))
  
  upper_left(samples)
  upper_right(samples)
  lower_left(samples)
  lower_right(samples)
}

# Create a new device
dev.new()

# Samples between 2007-02-01 00:00:00 and 2007-02-03 00:00:00
samples <- loadSamplesBetweenDates('2007-02-01', '2007-02-03')

# Render plot
plot4(samples)

# Render to png
render_to_png('plot4.png')

# Close device
dev.off()
