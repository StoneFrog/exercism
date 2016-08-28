class Series
  def initialize(serie)
    @serie = serie.chars.map(&:to_i)
    @serie_size = @serie.size
  end

  def slices(substring_length)
    raise ArgumentError if substring_longer_than_serie?(substring_length)
    (substring_length..@serie_size).inject([]) do |slices, position|
      slices << slice(substring_length, position)
    end
  end
  
  private
    def slice(offset, current_position)
      @serie[(current_position-offset)...current_position]
    end

    def substring_longer_than_serie?(substring_length)
      substring_length > @serie_size
    end
end