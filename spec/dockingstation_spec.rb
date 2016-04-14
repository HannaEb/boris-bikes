require 'dockingstation'

#SUBJECT IS AN INTANCE OF WHAT YOU DESCRIBE
describe DockingStation do
	bike = Bike.new

	it { expect(subject).to respond_to(:dock).with(1).argument }
	it { expect(subject).to respond_to(:release_bike) }

	describe "#initialize" do
		it 'defaults capacity' do
			described_class::DEFAULT_CAPACITY.times do
				subject.dock(bike)
			end
			expect{subject.dock(bike)}.to raise_error("station full")
		end

		it "checks for default capacity" do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end

		it "capacity is variable" do
			station = DockingStation.new(40)
			station.capacity.times{station.dock(Bike.new)}
			expect{station.dock(Bike.new)}.to raise_error("station full")
		end
	end

	describe '#release_bike' do
		it "raises an error if empty" do
		 		expect{subject.release_bike}.to raise_error("station empty")
		end
	end

	describe '#dock' do
		it "raises an error if full" do
			subject.dock(Bike.new)
			expect{subject.capacity.times{subject.dock(Bike.new)}}.to raise_error("station full")
		end
		it 'should be able to dock a bike' do
			expect(subject.dock(bike)).to eq([bike])
		end
	end

end
