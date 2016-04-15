require_relative 'dockingstation'

class Van
  attr_accessor :van_space

  def initialize
    @van_space = []
  end

  def pick_up
    @van_space += $broken_bikes
  end

  def drop_off
  end

end

#van.pick_up(station.track_broken)
