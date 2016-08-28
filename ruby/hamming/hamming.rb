class Hamming
  def self.compute(strand_1, strand_2)
    raise ArgumentError if strand_1.length != strand_2.length
    (strand_1.chars).zip(strand_2.chars).count { |pair_of_letters| pair_of_letters[0] != pair_of_letters[1] }
  end

  VERSION = 1
end