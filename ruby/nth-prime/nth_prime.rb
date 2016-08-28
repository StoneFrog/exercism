class Prime
  def self.nth(n)
    raise ArgumentError unless is_argument_valid?(n)
    (2..Float::INFINITY).lazy.select {|i| i if is_prime?(i)}.first(n).last
  end

  def is_prime?(number)
    (2...number).all? {|x| number % x != 0}
  end

  def is_argument_valid?(number)
    number.kind_of?(Integer) && number >= 1
  end
end