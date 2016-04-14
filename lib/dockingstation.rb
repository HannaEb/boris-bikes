require_relative 'bike'

class DockingStation
attr_reader :bike

	def initialize
	 	@bikes = []
	end

	def release_bike
		raise "Station empty" if @bikes.empty?
		@bikes.pop
	end

	def dock(bike)
		raise "Station full" if @bikes.count >= 20
		@bikes << bike
	end

end
