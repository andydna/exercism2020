require 'pry'

class Integer
  def english
    return %w(zero
              one
              two
              three
              four
              five
              six
              seven
              eight
              nine)[self] if self < 10

    return %w(ten
              twenty
              thirty
              forty
              fifty)[self/10-1] if (self%10).zero? and self < 51

    return %w(eleven
              twelve
              thirteen
              skip
              fifteen)[self-11] if [11,12,13,15].include? self

    return "#{(self%10).english}teen" if self < 20

    return "#{(self/10*10).english}-#{(self%10).english}" if self < 100

    return "#{(self/100).english} hundred" if (self%100).zero? and self < 1000

    #return "#{(self/100).english} hundred #{(self%100).english}"

    %w(thousand million billion).each.with_index(1) do |zillion, power|
      power *= 3
      if self < 10**(power+1)
        if (self%10**power).zero?
          return "#{(self/10**power).english} #{zillion}"
        end
        return "#{(self/10**power).english} #{zillion} #{(self%10**power).english}"
      end
    end
  end
end

class Say
  def initialize(number)
    @n = number
  end

  def in_english
    @n.english
  end
end
