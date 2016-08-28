class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return 0 if @trinary_string =~ /[^012]/
    numbers = @trinary_string.chars.reverse.map(&:to_i)
    numbers.each_with_index.inject(0) do |sum, (num, idx)|
      sum += num*(3**idx)
    end
  end
end