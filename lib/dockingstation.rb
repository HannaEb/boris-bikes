require_relative 'bike'

class DockingStation
attr_reader :bike

DEFAULT_CAPACITY = 20

	def initialize
	 	@bikes = []
	end

	def release_bike
		raise "Station empty" if empty?
		@bikes.pop
	end

	def dock(bike)
		raise "Station full" if full?
		@bikes << bike
	end

	private

	def full?
		@bikes.count >= DEFAULT_CAPACITY
	end


	def empty?
		@bikes.empty?
	end

end
