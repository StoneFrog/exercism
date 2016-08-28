class Binary
  VERSION = 2

  def initialize(binary_string)
    raise ArgumentError if binary_string =~ /[^01]+/
    @binaries = binary_string.split("").map(&:to_i)
  end

  def to_decimal
    @binaries.reverse.each_with_index.inject(0) do |sum, (num, idx)|
      sum += num*(2**idx)
    end
  end
end