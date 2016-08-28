class Year
  VERSION = 1

  def self.leap?(year)
    divisible_by_four_and_not_a_century?(year) || divisible_by_four_hundred?(year)
  end

  private
    def self.divisible_by_four_and_not_a_century?(year)
      divisible_by_four?(year) && not_a_century?(year)
    end

    def self.divisible_by_four?(year)
      year % 4 == 0
    end

    def self.not_a_century?(year)
      year % 100 != 0
    end

    def self.divisible_by_four_hundred?(year)
      year % 400 == 0
    end
end