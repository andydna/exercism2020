class Raindrops
  def self.convert(number)
    return "Pling" if (number//3 == 0) && number >= 3
    number.to_s
  end
end
