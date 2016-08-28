var DnaTranscriber = function() {
  this.nucleotideTranslator = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U'
  };
};

DnaTranscriber.prototype.toRna = function(dna_strand) {
  var complementary_rna = "";

  for (let nucleotide of dna_strand) {
    complementary_rna += this.nucleotideTranslator[nucleotide];
  };
  return complementary_rna;
};

module.exports = DnaTranscriber;