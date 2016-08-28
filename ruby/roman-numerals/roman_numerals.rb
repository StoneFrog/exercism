class Fixnum 
  VERSION = 1

  def to_roman
    current_value = self
    translation = ""
    translate_to_roman.each_pair do |key, value|
      quotient, current_value = current_value.divmod(key)
      translation += value * quotient
    end
    translation
  end

  def translate_to_roman
    {
      1000 => "M",
      900  => "CM",
      500  => "D",
      400  => "CD",
      100  => "C",
      90   => "XC",
      50   => "L",
      40   => "XL",
      10   => "X",
      9    => "IX",
      5    => "V",
      4    => "IV",
      1    => "I"
    }
  end
end