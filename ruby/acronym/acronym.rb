class Acronym
  VERSION = 1
  
  def self.abbreviate(input)
    input.scan(/^[A-Z]|(?<=\W)[a-zA-Z]|(?<=[a-z])[A-Z]/).join("").upcase
  end
end