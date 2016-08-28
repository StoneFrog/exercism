class Squares
  VERSION = 2

  def initialize(n)
    @values = (0..n).to_a
  end

  def square_of_sum
    (@values.reduce(:+))**2
  end

  def sum_of_squares
    @values.inject(0) { |current_sum, value| current_sum + (value**2) }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end