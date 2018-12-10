# frozen_string_literal: true

class Field
  attr_accessor :area, :size

  BORDER = 0
  SHIP = 8
  WATER = 1

  def initialize(size)
    @area = (0...size).inject([]) do |arr|
      arr << Array.new(size, WATER)
    end
    @size = size
    @ships_count = 0
  end

  def add_ship(ship)
    unless @area[ship.x_position][ship.y_position] == WATER
      raise('You can\'t put ship near another one')
    end

    update_position(ship.x_position, ship.y_position, SHIP)
    mark_borders ship.x_position, ship.y_position
    @ships_count += 1
    p '_________________________________________________________'
    p ['@ships_count', @ships_count]
    print_field
  end

  def mark_borders(x_position, y_position)
    update_position(x_position, y_position - 1, BORDER)
    update_position(x_position, y_position + 1, BORDER)
    update_position(x_position + 1, y_position - 1, BORDER)
    update_position(x_position + 1, y_position, BORDER)
    update_position(x_position + 1, y_position + 1, BORDER)
    update_position(x_position - 1, y_position - 1, BORDER)
    update_position(x_position - 1, y_position, BORDER)
    update_position(x_position - 1, y_position + 1, BORDER)
  end

  def update_position(x_position, y_position, value)
    unless x_position.negative? ||
           y_position.negative? ||
           x_position > @size - 1 ||
           y_position > @size - 1
      @area[x_position][y_position] = value
    end
  end

  def fill_randomly(quantity)
    while @ships_count < quantity
      raise "You should select #{@ships_count} or less ships count." if full?

      begin
        add_ship(Ship.new(random_position, random_position))
      rescue RuntimeError
      end
    end
  end

  def print_field
    @area.each do |line|
      p line
    end
  end

  protected

  def full?
    @area.flatten.none? { |place| place == WATER }
  end

  def random_position
    rand @size
  end
end
