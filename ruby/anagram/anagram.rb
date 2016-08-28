class Anagram
  def initialize(word)
    @word = word
    @sorted_word = sort_string(word)
  end

  def match(anagram_candidates)
    anagram_candidates.select { |candidate| anagram?(candidate) }
  end

  private
    def sort_string(string)
      string.downcase.chars.sort
    end

    def anagram?(test_word)
      sort_string(test_word) == @sorted_word && different_words?(test_word)
    end

    def different_words?(test_word)
      @word.downcase != test_word.downcase
    end
end