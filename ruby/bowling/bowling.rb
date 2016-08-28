class Game
  attr_reader :frames

  def initialize
    @frames = [Frame.new]
  end

  def roll(knocked)
    CustomErrors.wrong_pin_value_error if wrong_pin_value?(knocked)
    CustomErrors.game_over_error if game_over?
    update_round(knocked)
  end

  def score
    CustomErrors.should_use_fill_ball_error if fill_ball_not_used?
    CustomErrors.game_in_progress_error if game_in_progress?
    base = @frames.inject(0) { |sum, f| sum += f.frame_sum }
    bonus = frames.each_with_index.inject(0) {|sum, (f, idx)| sum += calculate_frame_bonus(idx)}
    base + bonus
  end

  private
  def calculate_frame_bonus(idx)
    if frames[idx].status == :spare
      frames[idx+1].throw_1
    elsif frames[idx].status == :strike && frames[idx+1].status == :strike
      frames[idx+1].throw_1 + frames[idx+2].throw_1
    elsif frames[idx].status == :strike
      frames[idx+1].throw_1 + frames[idx+1].throw_2
    else
      0
    end
  end

  def update_round(knocked)
    frame = current_frame
    frame.update_throws(knocked)
  end

  def current_frame
    if last_frame?
      @frames << FinalFrame.new
    elsif frames.last.status.is_a?(Symbol) && frames.size < 10
      @frames << Frame.new
    end
    frames.last
  end

  def last_frame?
    frames.last.status.is_a?(Symbol) && frames.size == 9
  end

  def game_over?
    frames.last.status == :finished
  end

  def wrong_pin_value?(value)
    incorrect_value?(value)
  end

  def game_in_progress?
    !game_over?
  end

  def fill_ball_not_used?
    frames.last.status != :finished && frames.size == 10
  end

  def incorrect_value?(value)
    !value.between?(0,10)
  end
end

class Frame
  attr_accessor :throw_1, :throw_2, :fill_ball, :status

  def update_throws(knocked)
    if throw_1.nil?
      update_first(knocked)
    elsif throw_2.nil?
      update_second(knocked)
    elsif fill_ball.nil?
      update_bonus(knocked)
    end
  end

  def frame_sum
    [throw_1, throw_2, fill_ball].compact.reduce(0, :+)
  end

  private
  def update_first(knocked)
    @throw_1 = knocked
    @status = :strike if knocked == 10
  end

  def update_second(knocked)
    CustomErrors.too_many_pins_error if too_many_knocked?(knocked)
    @throw_2 = knocked
    @status = frame_sum == 10 ? :spare : :open
  end

  def update_bonus(knocked)
    CustomErrors.too_many_pins_error if too_many_knocked_final?(knocked)
    @fill_ball = knocked
    @status = :finished
  end

  def too_many_knocked?(value)
    (throw_1 + value) > 10 && throw_1 != 10
  end

  def too_many_knocked_final?(value)
    (throw_2 + value) > 10 && throw_2 != 10
  end
end

class FinalFrame < Frame
  private
  def update_second(knocked)
    too_many_knocked?(knocked)
    @throw_2 = knocked
    @status = frame_sum < 10 ? :finished : :open
  end
end

module CustomErrors
  def self.too_many_pins_error
    raise RuntimeError, 'Pin count exceeds pins on the lane'
  end

  def self.should_use_fill_ball_error
    raise RuntimeError, 'Game is not yet over, cannot score!'
  end

  def self.game_in_progress_error
    raise RuntimeError, 'Score cannot be taken until the end of the game'
  end

  def self.wrong_pin_value_error
    raise RuntimeError, 'Pins must have a value from 0 to 10'
  end

  def self.game_over_error
    raise RuntimeError, 'Should not be able to roll after game is over'
  end
end

module BookKeeping
  VERSION = 1
end