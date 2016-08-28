class Hexadecimal
  def initialize(entry)
    @num = entry.upcase.chars.reverse
  end

  def to_decimal
    return 0 if invalid_number?(@num)
    @num.each_with_index.inject(0) do |sum, (char, idx)|
      sum += calculate_char(char, idx)
    end
  end

  private
    def calculate_char(char, idx)
      value = char_to_num(char)
      value*(16**idx)
    end

    def char_to_num(char)
      case
      when char =~ /\A[0-9]{1}\z/
        char.to_i
      when char =~ /\A[ABCDEF]\z/
        char.ord - 55
      end
    end

    def invalid_number?(chars)
      chars.join =~ /[^0-9ABCDEF]/
    end
end