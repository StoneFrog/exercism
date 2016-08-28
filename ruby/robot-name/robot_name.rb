class Robot
  class << self
    attr_accessor :taken_names
  end
  @taken_names = []

  def name
    @name ||= generate_new_name
  end

  def reset
    Robot.taken_names.delete(@name)
    @name = nil
  end

  def generate_new_name
    raise ArgumentError, "All available names are taken. Please kill a robot first" if reached_permutation_threshold?
    new_name = generate_two_letters + generate_three_digits
    while Robot.taken_names.include?(new_name)
      new_name = generate_two_letters + generate_three_digits
    end
    Robot.taken_names << new_name
    new_name
  end

  def generate_two_letters
    letters = ('A'..'Z').to_a
    (0..1).map { letters[rand(letters.length)] }.join
  end

  def generate_three_digits
    rand.to_s[2..4]
  end

  # Prevent from entering while loop if there are no more valid
  # names to take
  def reached_permutation_threshold?
    Robot.taken_names.size >= permutation_threshold
  end

  # Amount of possible names
  def permutation_threshold
    available_letters_permutations = ('A'..'Z').to_a.size**2
    available_numbers_permutations = (0..9).size**3
    available_letters_permutations * available_numbers_permutations
  end
end