class Array
  def my_uniq
    arr = []
    self.each { |num| arr << num if !arr.include?(num) }
    p arr
  end

  def two_sum
    arr = []
    (0..self.length).each do |idx|
      second_pos = idx + 1
      (second_pos..self.length-1).each do |second_idx|
        if self[idx] + self[second_idx] == 0
          arr << [idx, second_idx]
        end
      end
    end

    p arr
  end

  def median
    sorted = self.sort
    if sorted.count.odd?
      sorted[(sorted.length - 1) / 2]
    else 
      (sorted[(sorted.length / 2)] + sorted[(sorted.length / 2 - 1)]) / 2.0
    end
  end

  def my_transpose
    big_arr = []
    while self.first.count != 0
      new_row = []
      self.each do |row|
         new_row << row[0]
         row.shift
      end
      big_arr << new_row
    end

    p big_arr
  end
end

class String
  def caesar(num)
    max = "z".ord
    word = self.chars.map do |char|
      shifted = chars.ord + num
      shifted -= 26 if shifted > max
      shifted.chr
    end

    p word.join()
  end
end

class Hash
  def difference(h)
    diff = {}
    self.each do |k, v|
      diff[k] = v if !h.keys.include?(k)
    end
    h.each do |k, v|
      diff[k] = v if !self.keys.include?(k)
    end

    p diff
  end
end

class Fixnum
  def stringify(base)
    letters = { 
      10 => "A", 
      11 => "B", 
      12 => "C", 
      13 => "D", 
      14 => "E", 
      15 => "F" 
    }
    arr = []
    i = 0
    while self / (base**i) != 0
      digit = (self / (base**i)) % base
      digit > 9 ? arr.unshift(letters[digit]) : arr.unshift(digit)
      i += 1
    end
    
    p arr.join()
  end
end

