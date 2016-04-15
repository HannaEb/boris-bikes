require 'dockingstation'

#SUBJECT IS AN INTANCE OF WHAT YOU DESCRIBE
describe DockingStation do
	let(:bike) { double :bike}
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
			station.capacity.times{station.dock(bike)}
			expect{station.dock(bike)}.to raise_error("station full")
		end
	end

	describe '#release_bike' do
		it "raises an error if empty" do
		 	expect{subject.release_bike}.to raise_error("station empty")
		end

		it "should not release broken bikes" do
			bike = double("bike", :broken? => true)
			subject.dock(bike)
			expect{subject.release_bike}.to raise_error("bike is broken")
		end

		it "release working bikes" do
			bike = double("bike", :working? => true, :broken? => false)
			subject.dock(bike)
			expect(subject.release_bike).to be bike
		end
	end

	describe '#dock' do
		it "raises an error if full" do
			subject.dock(bike)
			expect{subject.capacity.times{subject.dock(bike)}}.to raise_error("station full")
		end
		it 'should be able to dock a bike' do
			expect(subject.dock(bike)).to eq([bike])
		end
	end

end
