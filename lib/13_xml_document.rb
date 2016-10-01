class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_level = 0
  end

  def method_missing(method_name, options = {}, &block)
    string = ""
    string << "<#{method_name}"

    options.each do |key, value|
      string << " #{key}=\"#{value}\""
    end

    if block
      string << ">"
      string << "\n" if @indent
      @indent_level += 1
      string << ("  " * @indent_level) if @indent
      string << yield
      @indent_level -= 1
      string << ("  " * @indent_level) if @indent
      string << "</#{method_name}>"
      string << "\n" if @indent
    else
      string << "/>"
      string << "\n" if @indent
    end

    string
  end
end
