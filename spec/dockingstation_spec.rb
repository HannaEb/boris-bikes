require 'dockingstation'

#SUBJECT IS AN INTANCE OF WHAT YOU DESCRIBE
describe DockingStation do
	bike = Bike.new

		it "releases a bike method" do
		expect(subject).to respond_to(:release_bike)
		end

	describe '#release_bike' do
		it "raises an error if empty" do
		 		expect{subject.release_bike}.to raise_error("Station empty")
		end
	end

	describe '#dock' do
		it "raises an error if full" do
			subject.dock(Bike.new)
			expect{DockingStation::DEFAULT_CAPACITY.times{subject.dock(Bike.new)}}.to raise_error("Station full")
		end
	end

		it "creates a new bike" do
			puts "yes, new bike has been created :)"
		end

	it { is_expected.to respond_to(:bike)}
	it { should respond_to(:dock).with(1).argument }

	it 'expect the bike to be working' do
		expect(bike.working?).to be true
	end

	it 'should be able to dock a bike' do
		expect(subject.dock(bike)).to eq([bike])
	end
end
