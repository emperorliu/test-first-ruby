class Book
  attr_accessor :title

  def title=(name)
    exceptions = ["the", "a", "an", "and", "in", "of"]
    name[0] = name[0].upcase
    name = name.split.each do |word|
      word[0] = word[0].upcase unless exceptions.include?(word) 
    end
    @title = name.join(" ")
  end
end

