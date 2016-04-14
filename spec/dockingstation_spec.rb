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
			bike.report_broken
			station = DockingStation.new
			station.dock(bike)
			expect{station.release_bike}.to raise_error("bike is broken")
		end

		it "release working bikes" do
			allow(bike).to receive(:working).and_return(true)
			subject.dock(bike)
			release_bike = subject.release_bike
			expect(released_bike).to be_working
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
