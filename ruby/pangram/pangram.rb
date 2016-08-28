class Pangram
  VERSION = 1
  ALPHABET = ('a'..'z').to_a.join('')

  def self.is_pangram?(expression)
    ALPHABET.delete(expression.downcase).empty?
  end
end