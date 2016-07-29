class Fixnum
  def in_words
    hash = {
      0 => nil,
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen", 
      18 => "eighteen",
      19 => "nineteen",
    }

    ty = {
      1 => "ten",
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }

    scale = [
      nil,
      "thousand",
      "million",
      "billion",
      "trillion"
    ]

    chunks = []
    num = self
    while num > 0
      num, chunk = num.divmod(1000)
      chunks << chunk
    end

    strings = chunks.map do |number|
      string = []

      hundreds, remainder = number.divmod(100)
      string << "#{hash[hundreds]} hundred" if hundreds > 0

      tens, units = remainder < 20 ? [nil, remainder] : remainder.divmod(10)
      string << [ty[tens], hash[units]].compact.join(" ")

      string.join(" ")
    end

    if strings.empty?
      (strings << "zero").join(" ").strip
    else 
      strings = strings.zip(scale).reverse
      strings.delete_if { |x| x.first.empty? }
      strings.flatten.compact.join(" ").strip
    end
  end


end