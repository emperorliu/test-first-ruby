class Temperature
  attr_reader :temp

  def initialize(args)
    @temp = args
    if @temp.key?(:f)
      @temp[:f] = args[:f]
    else
      @temp[:c] = args[:c]
    end
  end

  def in_celsius
    temp[:c] ? temp[:c] : (temp[:f] - 32) * (5.0 / 9.0)
  end

  def in_fahrenheit
    temp[:f] ? temp[:f] : (temp[:c] * 1.8) + 32
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end
end

class Celsius < Temperature
  def initialize(temp)
    super(:c => temp)
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    super(:f => temp)
  end
end