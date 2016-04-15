require 'bike.rb'

class Van

  def initialize(array)
    @array = array
  end

  def broken_bikes
    array_new = @array.select { |bike| bike.broken? }
  end

  def fix_bikes
    @array
  end

end
