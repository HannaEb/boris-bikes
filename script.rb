require './lib/dockingstation.rb'

station = DockingStation.new
bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new

bike1.report_broken
bike2.report_broken

bike1.broken?
bike3.broken?

station.dock(bike1)
station.dock(bike2)
station.dock(bike3)

station.track_broken

require './lib/van.rb'
van = Van.new

van.pick_up(station.broken_bikes)
