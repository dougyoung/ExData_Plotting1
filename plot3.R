source('load_samples.R')

plot3 <- function(samples) {
  # Plot of Sub-meters 1 through 3, inclusive, over sample period
  with(samples, {
    plot(
      Sub_metering_1 ~ DateTime,
      col='black',
      type='l',
      xlab='',
      ylab='Energy sub metering'
    )
    lines(Sub_metering_2 ~ DateTime, col='red')
    lines(Sub_metering_3 ~ DateTime, col='blue')
    legend(
      'topright', 
      col=c('black', 'red', 'blue'), 
      lty=1, 
      lwd=1,
      legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
    )
  })
}

# Create a new device
dev.new()

# Samples between 2007-02-01 00:00:00 and 2007-02-03 00:00:00
samples <- loadSamplesBetweenDates('2007-02-01', '2007-02-03')

# Render plot
plot3(samples)

# Render to png
render_to_png('plot3.png')

# Close device
dev.off()
