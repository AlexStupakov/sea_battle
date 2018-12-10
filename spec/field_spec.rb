# frozen_string_literal: true

require 'spec_helper'

describe 'Field' do
  describe 'fill_randomly' do
    let(:field) { Field.new(6) }

    it 'should raise error if you set more ships than admit' do
      expect { field.fill_randomly(10) }
        .to raise_error(RuntimeError, /You should select .+ or less ships count./)
    end

    it 'should not raise error if you set more ships than admit' do
      expect { field.fill_randomly(5) }
        .to_not raise_error(RuntimeError, /You should select .+ or less ships count./)
    end
  end

  describe 'add_ship' do
    let(:field) { Field.new(4) }

    it 'should raise error if you put ship near another one' do
      field.add_ship Ship.new(0, 0)

      expect { field.add_ship(Ship.new(1, 1)) }
        .to raise_error("You can't put ship near another one")
    end

    it 'should not raise error if you put ship on free water' do
      field.add_ship Ship.new(0, 0)

      expect { field.add_ship(Ship.new(1, 2)) }
        .to_not raise_error("You can't put ship near another one")
    end
  end

  describe 'mark_borders' do
    let(:field) { Field.new(4) }

    it 'should properly fills [0,0]' do
      field.add_ship Ship.new(0, 0)
      field.print_field

      expect(field.area)
        .to eq [[1, 0, 9, 9], [0, 0, 9, 9], [9, 9, 9, 9], [9, 9, 9, 9]]
    end
    it 'should properly fills [0,3]' do
      field.add_ship Ship.new(0, 3)
      field.print_field

      expect(field.area)
        .to eq [[9, 9, 0, 1], [9, 9, 0, 0], [9, 9, 9, 9], [9, 9, 9, 9]]
    end
    it 'should properly fills [3,3]' do
      field.add_ship Ship.new(3, 3)
      field.print_field

      expect(field.area)
        .to eq [[9, 9, 9, 9], [9, 9, 9, 9], [9, 9, 0, 0], [9, 9, 0, 1]]
    end
    it 'should properly fills [1,1]' do
      field.add_ship Ship.new(1, 1)
      field.print_field

      expect(field.area)
        .to eq [[0, 0, 0, 9], [0, 1, 0, 9], [0, 0, 0, 9], [9, 9, 9, 9]]
    end
  end
end
