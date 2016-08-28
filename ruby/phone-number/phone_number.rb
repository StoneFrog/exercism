class PhoneNumber
  def initialize(input_number)
    @input_number = input_number
    
  end

  def number
    return '0000000000' if any_letters?
    stripped_number = strip_non_digits
    process_number(stripped_number)
  end

  def area_code
    number[0..2]
  end

  def to_s
    raw_number = number
    "(#{raw_number[0..2]}) #{raw_number[3..5]}-#{raw_number[6..-1]}"
  end

  private
    def any_letters?
      !!(@input_number =~ /[a-zA-Z]+/)
    end

    def strip_non_digits
      @input_number.gsub(/[\D]/, "")
    end

    def process_number(stripped_number)
      case
      when has_ten_digits?(stripped_number)
        stripped_number
      when has_eleven_digits_and_starts_with_1?(stripped_number)
        stripped_number[1..-1]
      else
        '0000000000'
      end
    end

    def has_ten_digits?(stripped_number)
      stripped_number.length == 10
    end

    def has_eleven_digits_and_starts_with_1?(stripped_number)
      stripped_number.length == 11 && stripped_number[0] == "1"
    end
end