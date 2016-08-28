var Hamming = function() {};

Hamming.prototype.compute = function(strand1, strand2) {
  this.validateLength(strand1.length, strand2.length)

  var counter = 0;
  for (var idx = 0; idx < strand1.length; idx++) {
    if (strand1.charAt(idx) !== strand2.charAt(idx)) {
      counter++;
    };
  };
  return counter;
};

Hamming.prototype.validateLength = function(length1, length2) {
  if (length1 !== length2) {
    throw 'DNA strands must be of equal length.'
  };
}

module.exports = Hamming;