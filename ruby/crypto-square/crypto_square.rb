class Crypto
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.gsub(/[^a-zA-Z\d]/, '').downcase
  end

  def size
    (normalize_plaintext.length**0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/(\w{1,#{size}})/).flatten
  end

  def ciphertext
    transpose.map { |segment| segment.join("") }.join("")
  end

  def normalize_ciphertext
    transpose.map { |segment| segment.join("") }.join(" ")
  end

  private
    def transpose
      default_size = size
      plaintext_segments.map do |segment|
        splitted_segment = segment.chars
        fill_array_to_size(default_size, splitted_segment.size, splitted_segment)
      end.transpose
    end

    # This is necessary to make transpose work
    def fill_array_to_size(required_size, current_size, analyzed_array)
      (required_size - current_size).times { |x| analyzed_array << "" }
      analyzed_array
    end
end