class Scrabble
  def initialize(input)
    @word = input.nil? ? "" : input.strip.upcase
  end

  def score
    @word.each_char.inject([]) do |points, char|
      points << SCORE_TABLE.select { |k, val| k.include?(char) }.values.first
    end.reduce(0, :+)
  end

  def self.score(input)
    new(input).score
  end

  SCORE_TABLE = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ] => 1,
    ["D", "G"]                                          => 2,
    ["B", "C", "M", "P"]                                => 3,
    ["F", "H", "V", "W", "Y" ]                          => 4,
    ["K"]                                               => 5,
    ["J", "X"]                                          => 8,
    ["Q", "Z"]                                          => 10
  }.freeze
end