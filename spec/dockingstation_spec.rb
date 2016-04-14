require "dockingstation"

 describe DockingStation do
   it 'expects capacity to equal user input or 20' do
     expect(subject.capacity).to eq 20
     station = DockingStation.new(45)
     expect(station.capacity).to eq 45
   end

   describe '#release_bike' do
    it 'raises an error when no bikes available' do
      expect{subject.release_bike}.to raise_error ("no bikes available")
    end

    let(:bike) { double(:bike) }
    it 'raises an error when no bikes are working' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error ("no working bikes")
    end

    it 'releases working bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      expect(subject.release_bike).not_to be_broken
    end

    end
    describe '#dock' do
      it 'raises an error when there are no docks available' do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock(double(:bike))}
        expect{subject.dock(double(:bike))}.to raise_error ("no docks available")
      end
    end
  end
    #expect(newbike).to be_working
