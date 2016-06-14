class Array
  def sum
    self.inject(0, :+)
  end

  def square
    self.map { |num| num**2 }
  end

  def square!
    self.map! { |num| num**2 }
  end
end