class SumOfMultiples
  def initialize(*nums)
    @numbers = nums || [3, 5]
  end

  def to(limit)
    all_multiples = @numbers.inject([]) do |multiples, number|
      multiples += find_multiples(number, limit)
    end.uniq.reduce(0, :+)
  end

  private
    def find_multiples(base_number, limit)
      multiples = []
      current_number = base_number
      while current_number < limit
        multiples << current_number
        current_number += base_number
      end
      multiples
    end
end