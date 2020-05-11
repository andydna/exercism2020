class Bob
  def self.hey(call)
    new(call).response
  end

  def initialize(@call : String)
  end

  def response
    if silent?
      "Fine. Be that way!" 
    elsif forceful_question?
      "Calm down, I know what I'm doing!" 
    elsif shouting?
      "Whoa, chill out!" 
    elsif asking?
      "Sure." 
    else
      "Whatever."
    end
  end

  def silent?
    @call.strip.empty?
  end

  def forceful_question?
    shouting? && asking?
  end

  def shouting?
    (@call == @call.upcase) && @call.match /[a-zA-Z]/
  end

  def asking?
    @call.chars.last == '?'
  end
end
