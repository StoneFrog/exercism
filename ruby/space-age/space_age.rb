class SpaceAge
  attr_reader :seconds
  
  def initialize(seconds)
    @seconds = seconds
  end

  EARTH_YEAR_IN_SECONDS = 31557600.0

  PLANETS_YEAR_DURATION_IN_SECONDS = {
      mercury: EARTH_YEAR_IN_SECONDS * 0.2408467,
      venus:   EARTH_YEAR_IN_SECONDS * 0.61519726,
      earth:   EARTH_YEAR_IN_SECONDS,
      mars:    EARTH_YEAR_IN_SECONDS * 1.8808158,
      jupiter: EARTH_YEAR_IN_SECONDS * 11.862615,
      saturn:  EARTH_YEAR_IN_SECONDS * 29.447498,
      uranus:  EARTH_YEAR_IN_SECONDS * 84.016846,
      neptune: EARTH_YEAR_IN_SECONDS * 164.79132
    }.freeze

  PLANETS_YEAR_DURATION_IN_SECONDS.each do |planet, year_duration|
    define_method("on_#{planet}") do
      (seconds/year_duration).round(2)
    end
  end
end