class Phrase
  VERSION = 1

  def initialize(phrase)
    @words_array = phrase.downcase.scan(/\w+'*\w+|\d+/)
  end

  def word_count
    words_hash = Hash.new(0)
    @words_array.each { |word| words_hash[word] += 1 }
    words_hash
  end
end