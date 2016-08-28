class Complement
  def self.of_dna(rna)
    nucleotides = rna.split("")
    raise ArgumentError unless (nucleotides - complementary_nucleotides.keys).empty?
    nucleotides.inject("") { |complementary, nucleotide| complementary << complementary_nucleotides.fetch(nucleotide) }
  end

  def self.complementary_nucleotides
    {
      "C" => "G",
      "G" => "C",
      "T" => "A",
      "A" => "U"
    }
  end

  VERSION = 3
end