class Bike

	def working?
		true
	end

	def report_broken
		@broken = true
	end

	private

	def broken?
		@broken
	end

end
