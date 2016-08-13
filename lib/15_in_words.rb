class Fixnum
  HASH = {
    0 => nil,
    1 => :one,
    2 => :two,
    3 => :three,
    4 => :four,
    5 => :five,
    6 => :six,
    7 => :seven,
    8 => :eight,
    9 => :nine,
    10 => :ten,
    11 => :eleven,
    12 => :twelve,
    13 => :thirteen,
    14 => :fourteen,
    15 => :fifteen,
    16 => :sixteen,
    17 => :seventeen, 
    18 => :eighteen,
    19 => :nineteen,
  }

  TY = {
    1 => :ten,
    2 => :twenty,
    3 => :thirty,
    4 => :forty,
    5 => :fifty,
    6 => :sixty,
    7 => :seventy,
    8 => :eighty,
    9 => :ninety
  }

  SCALE = [
    nil,
    "thousand",
    "million",
    "billion",
    "trillion"
  ]

  def in_words
    num = self
    # self is referring to the number that this method gets called on

    chunks = split_into_chunks_of_three(num)
    strings = convert_three_digit_chunks_to_words(chunks)
    apply_scale_to_chunks(strings)
  end

  def split_into_chunks_of_three(num)
    chunks = []
    while num > 0
      num, chunk = num.divmod(1000)
      chunks << chunk
    end
    chunks
  end

  def convert_three_digit_chunks_to_words(chunks)
    chunks.map do |number|
      string = []

      hundreds, remainder = number.divmod(100)
      string << "#{HASH[hundreds]} hundred" if hundreds > 0

      tens, units = remainder < 20 ? [nil, remainder] : remainder.divmod(10)
      string << [TY[tens], HASH[units]].compact.join(" ")

      string.join(" ")
    end
  end

  def apply_scale_to_chunks(strings)
    if strings.empty?
      (strings << "zero").join(" ").strip
    else 
      strings = strings.zip(SCALE).reverse
      strings.delete_if { |x| x.first.empty? }
      strings.flatten.compact.join(" ").strip
    end
  end

end