require_relative 'bike'

class DockingStation
attr_accessor :capacity

DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
	 	@bikes = []
		@capacity = capacity
	end

	def release_bike
		raise "station empty" if empty?
		raise "bike is broken" if @bikes.last.broken?
		@bikes.pop if @bikes.last.working?
	end

	def dock(bike)
		raise "station full" if full?
		@bikes << bike
	end

	private

attr_reader :bikes

	def full?
		@bikes.count >= @capacity
	end


	def empty?
		@bikes.empty?
	end

end
