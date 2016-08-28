class FoodChain
  VERSION = 2

  def self.song
    lyrics = ""
    food_chain.each_with_index do |animal, idx|
      lyrics += connectors(animal)[:intro]
      lyrics += animals_responses[animal]
      break if animal == :horse
      lyrics += fill_up_chain(idx)
      lyrics += connectors[:ending]
    end
    lyrics
  end

  private 
    def self.food_chain
      [:fly, :spider, :bird, :cat, :dog, :goat, :cow, :horse]
    end

    def self.fill_up_chain(last_predator, lyrics="")
      current_chain = food_chain[0..last_predator].reverse
      current_chain[0..-2].each_with_index do |animal, index|
        lyrics += transition(animal, current_chain[index+1])
      end
      lyrics
    end

    def self.transition(animal_1, animal_2)
      line = "She swallowed the #{animal_1.to_s} to catch the #{animal_2.to_s}"
      line += animal_2 == :spider ? " that wriggled and jiggled and tickled inside her.\n" : ".\n"
    end

    def self.animals_responses
      { 
        fly: "",
        spider: "It wriggled and jiggled and tickled inside her.\n",
        bird: "How absurd to swallow a bird!\n",
        cat: "Imagine that, to swallow a cat!\n",
        dog: "What a hog, to swallow a dog!\n",
        goat: "Just opened her throat and swallowed a goat!\n",
        cow: "I don't know how she swallowed a cow!\n",
        horse: "She's dead, of course!\n"
      }
    end

    def self.connectors(animal=nil)
      {
        intro: "I know an old lady who swallowed a #{animal.to_s}.\n",
        ending: "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
      }
    end
end