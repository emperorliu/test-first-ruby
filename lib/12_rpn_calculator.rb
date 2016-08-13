class RPNCalculator
  attr_accessor :arr

  def initialize
    @arr = []
  end

  def push(num)
    arr << num
  end

  def plus
    check_if_empty
    added = arr.pop(2).reduce(:+)
    arr << added
  end

  def minus
    check_if_empty
    subtracted = arr.pop(2).inject(:-)
    arr << subtracted
  end

  def times
    check_if_empty
    multiplied = arr.pop(2).inject(:*)
    arr << multiplied
  end

  def divide
    check_if_empty
    divided = arr.pop(2).map{ |num| num.to_f }.inject(:/)
    arr << divided
  end

  def value
    arr.last
  end

  def check_if_empty
    raise "calculator is empty" if arr.empty?
  end

  def tokens(str)
    str.split.map { |c| c[/\d/] ? c.to_i : c.to_sym }
  end

  def evaluate(str)
    tokenized = tokens(str)
    tokenized.each do |c|
      case c
      when Integer; push(c)
      when :+; plus
      when :-; minus
      when :*; times
      else; divide
      end
    end

    value
  end
end
