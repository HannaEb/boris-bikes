require_relative 'bike'

class DockingStation
attr_accessor :capacity, :bikes, :broken_bikes

DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
		$broken_bikes = []
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

	def track_broken
		$broken_bikes, @bikes = @bikes.partition { |bike| bike.broken?}
	end

	private

	def full?
		@bikes.count >= @capacity
	end


	def empty?
		@bikes.empty?
	end

end
