class Nucleotide
  attr_reader :dna

  def self.from_dna(dna_strain)
    raise ArgumentError if dna_not_valid?(dna_strain)
    new(dna_strain.chars)
  end

  def initialize(splitted_dna)
    @dna = splitted_dna
  end

  def count(nucleotide)
    dna.count {|x| x == nucleotide }
  end

  def histogram
    ['A', 'T', 'C', 'G'].inject({}) do |result, nucleoutide|
      result[nucleoutide] = count(nucleoutide)
      result
    end
  end

  private
    def self.dna_not_valid?(dna_strain)
      dna_strain =~ /[^ATGC]/
    end
end