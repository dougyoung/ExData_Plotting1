source('load_samples.R')
source('render_to_png.R')

plot2 <- function(samples) {
  # Line plot of Global Active Power given the DateTime
  # Plot has these properties:
  #   type: line plot
  #   x-axis label: Day of the week, abbreviated
  #   y-axis label: Global Active Power (kilowatts)
  plot(
    samples$Global_active_power ~ samples$DateTime,
    type='l',
    xlab='',
    ylab='Global Active Power (kilowatts)'
  )
}

# Create a new device
dev.new()

# Samples between 2007-02-01 00:00:00 and 2007-02-03 00:00:00
samples <- loadSamplesBetweenDates('2007-02-01', '2007-02-03')

# Render plot
plot2(samples)

# Render to png
render_to_png('plot2.png')

# Close device
dev.off()
