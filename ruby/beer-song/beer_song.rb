class BeerSong
  VERSION=2

  def verse(number)
    template_number_mapping(number).detect { |key, val| key === number}.last
  end

  def verses(start_verse, end_verse)
    (start_verse.downto(end_verse)).map { |num| verse(num)}.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end

  private
    def template_number_mapping(number)
      {
        0     => no_beer,
        1     => one_left,
        2..99 => still_have_beer(number)
      }
    end

    def no_beer
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    def one_left
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def still_have_beer(number)
      "#{number} #{pluralize_bottle(number)} of beer on the wall, #{number} #{pluralize_bottle(number)} of beer.\n" \
      "Take one down and pass it around, #{number-1} #{pluralize_bottle(number-1)} of beer on the wall.\n"
    end

    def pluralize_bottle(number)
      number == 1 ? "bottle" : "bottles"
    end
end