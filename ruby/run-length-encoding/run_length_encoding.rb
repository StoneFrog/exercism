class RunLengthEncoding
  VERSION = 1

  def self.encode(input)
    input.scan(/((.)\2*)/).inject("") do |encoded_message, (group, char)|
      encoded_message += "#{get_number(group.size)}#{char[0]}"
    end
  end

  def self.decode(input)
    input.scan(/(\d+)?(.)/).inject("") do |decoded_message, (num, char)|
      num = num.to_i == 0 ? 1 : num.to_i
      decoded_message += "#{char * num}"
    end
  end

  private
    def self.get_number(size)
      size == 1 ? "" : "#{size}"
    end
end