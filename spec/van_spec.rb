require 'van'

describe Van do

    it 'is a able to pick up bikes' do
      bike = double("bike", :broken => true)
      subject.van_space << bike
    expect(subject.pick_up).not_to be_empty
  end
end
