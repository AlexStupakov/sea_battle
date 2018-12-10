# frozen_string_literal: true

class Ship
  attr_accessor :x_position, :y_position
  def initialize(x_position, y_position)
    @x_position = x_position
    @y_position = y_position
  end
end
