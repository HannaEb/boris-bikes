require 'dockingstation'

#SUBJECT IS AN INTANCE OF WHAT YOU DESCRIBE
describe DockingStation do
	bike = Bike.new

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

	it "releases a bike method" do
		expect(subject).to respond_to(:release_bike)
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
	end

		it "creates a new bike" do
			puts "yes, new bike has been created :)"
		end

	it { should respond_to(:dock).with(1).argument }

	it 'expect the bike to be working' do
		expect(bike.working?).to be true
	end

	it 'should be able to dock a bike' do
		expect(subject.dock(bike)).to eq([bike])
	end
end
