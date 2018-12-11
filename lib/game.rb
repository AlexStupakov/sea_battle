# frozen_string_literal: true

require './field'
require './ship'

class Game
  def start
    puts 'Please enter field size'
    size = gets.to_i
    puts 'Please enter ships quantity'
    quantity = gets.to_i
    ours_field = Field.new(size)
    ours_field.fill_randomly(quantity)
    theirs_field = Field.new(size)
    theirs_field.fill_randomly(quantity)
    puts 'Your ships:'
    ours_field.print_field
    beginer = rand 2
  end

  def our_turn; end

  def their_turn; end
end
