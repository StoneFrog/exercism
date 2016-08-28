class Raindrops
  VERSION = 1

  def self.convert(number)
    response = valid_responses.select {|divisor, response| number % divisor == 0 }.values.join
    response.empty? ? number.to_s : response
  end

  def self.valid_responses
    {
      3 => "Pling",
      5 => "Plang",
      7 => "Plong"
    }
  end
end