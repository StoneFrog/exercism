class Clock
  def self.at(hour, minutes=0)
    new((hour * 60) + minutes)
  end

  attr_reader :minutes_since_midnight

  def initialize(minutes)
    @minutes_since_midnight = minutes
  end

  def to_s
    hours, minutes = minutes_since_midnight.divmod(60)
    "#{prefix_with_zero(hours)}:#{prefix_with_zero(minutes)}"
  end

  def +(minutes)
    @minutes_since_midnight = strip_days(@minutes_since_midnight + minutes)
    self
  end

  def -(minutes)
    @minutes_since_midnight -= strip_days(minutes)
    subtract_from_midnight if date_crossed_backwards?
    self
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  private
    def strip_days(minutes)
      minutes % (24*60)
    end

    def prefix_with_zero(num)
      num < 10 ? "0#{num}" : num
    end

    def date_crossed_backwards?
      @minutes_since_midnight < 0
    end

    def subtract_from_midnight
      # Since negative minutes mean how much is it
      # before midnight, we need to subtract them from number
      # that represents midnight i.e. 24h * 60min
      @minutes_since_midnight += (24*60)
    end
end