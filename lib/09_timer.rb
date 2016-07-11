class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    minutes = self.seconds / 60
    seconds = self.seconds % 60
    hours = minutes / 60
    minutes = minutes % 60

    "%02d:%02d:%02d" % [hours, minutes, seconds]
  end
end