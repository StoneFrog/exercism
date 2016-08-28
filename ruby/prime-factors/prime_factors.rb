class PrimeFactors
  def self.for(number, last_prime=2)
    return [] if number == 1
    prime = (last_prime..number).find {|x| number % x == 0}
    [prime] + self.for(number/prime, prime)
  end
end