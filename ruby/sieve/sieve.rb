class Sieve

  def initialize(n)
    @n = n
    @numbers = (2..n).to_a
  end

  def primes
    @numbers.each do |number|
      (number..@n/number).each { |factor| @numbers.delete(number*factor) }
    end
  end
end