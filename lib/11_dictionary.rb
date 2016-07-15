class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    if !entry.is_a?(Hash)
      entries[entry] = nil
    else
      key = entry.keys[0]
      value = entry.values[0]
      entries[key] = value
    end
  end

  def keywords
    entries.keys.sort
  end

  def include?(keyword)
    keywords.include?(keyword)
  end

  def find(match)
    result = {}
    entries.each do |key, value|
      if /^#{match}+/ =~ key
        result[key] = value
      end
    end

    result
  end

  def printable
    quote = []
    keywords.each do |keyword|
      quote << "[#{keyword}] \"#{entries[keyword]}\""
    end
    quote.join("\n")
  end
end