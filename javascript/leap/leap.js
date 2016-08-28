var Year = function(value) {
  this.year = value;
};

Year.prototype.isLeap = function() {
  var year = this.year;
  return ((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0);
};

module.exports = Year;