class Alphametics
  attr_reader :splitted_phrase, :original_phrase

  def solve(phrase)
    @original_phrase = phrase.gsub("^", "**")
    @splitted_phrase = phrase.scan(/[a-zA-Z]+/).map(&:chars)
    solve_with_brute_force
  end

  private

  def solve_with_brute_force
    unique_letters = splitted_phrase.flatten.uniq
    (lower_limit(unique_letters.size)..upper_limit(unique_letters.size)).each do |num|
      splitted_number = fill_and_split_into_digits(num, unique_letters.size)
      next if any_digit_repeats?(splitted_number)
      association = assign_numbers_to_letters(unique_letters, splitted_number)
      if equation_works_out?(association)
        association.map {|letter, digit| association[letter] = digit.to_i}
        return association
      end
    end
    nil
  end

  def lower_limit(exponent)
    0.upto(exponent-1).inject("") { |extra, num| extra += num.to_s }.to_i
  end

  def upper_limit(exponent)
    9.downto(10 - exponent).inject("") { |extra, num| extra += num.to_s }.to_i
  end

  def fill_and_split_into_digits(number, max_size)
    stringified_number = number.to_s
    stringified_number.insert(0, "0" * (max_size - stringified_number.length)).chars
  end

  def any_digit_repeats?(splitted_number)
    splitted_number.size != splitted_number.uniq.size
  end

  def assign_numbers_to_letters(letters, digits)
    letters.zip(digits).inject({}) {|association, (letter, digit)| association.merge!(letter => digit) }
  end

  def equation_works_out?(association)
    phrase = original_phrase.dup
    phrase = convert_to_digits(association, phrase)
    equation_sides = phrase.split("==")
    return false if any_number_starts_with_zero?(association)
    eval(equation_sides.first) == eval(equation_sides.last)
  end

  def convert_to_digits(association, phrase)
    association.each {|letter, digit| phrase.gsub!(letter, digit) }
    phrase
  end

  def any_number_starts_with_zero?(association)
    splitted_phrase.any? {|digits_set| association[digits_set.first] == "0" && digits_set.size > 1 }
  end
end

module BookKeeping
  VERSION = 2
end