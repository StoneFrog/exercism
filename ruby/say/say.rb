class Say
  attr_reader :number

  def initialize(number)
    raise ArgumentError if invalid_number?(number)
    @number = number.to_s
  end

  def in_english
    return "zero" if number.to_i == 0

    splitted = number.gsub(/(\d)(?=(\d{3})*(?!\d))/, "\\1 ").split(" ").reverse.map(&:to_i)

    splitted.each_with_index.inject("") do |translation, (seg, idx)|
      translation = translate_segment(seg) + get_magnitude(idx, seg) + translation
    end.strip
  end

  private

  def get_magnitude(index, segment)
    segment == 0 ? "" : "#{INDEX_TO_NUMBER_SCALE_NAME[index]} "
  end

  def translate_segment(segment)
    translation = []
    translation << DICTIONARY[segment / 100]
    translation << (DICTIONARY[segment % 100] || [DICTIONARY[((segment % 100) / 10) * 10], DICTIONARY[segment % 10]].compact.join("-"))
    translation = translation.compact.join(" hundred ").strip

    translation == "" ? "" : "#{translation} "
  end

  def invalid_number?(value)
    value < 0 || value >= 10**12
  end

  DICTIONARY = {
    0 => nil,
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }.freeze

  INDEX_TO_NUMBER_SCALE_NAME = {
    0 => "",
    1 => "thousand",
    2 => "million",
    3 => "billion"
  }.freeze
end