# frozen_string_literal: true

# Board class
class Board
  attr_accessor :fields

  def initialize
    @fields = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
                6 => '', 7 => '', 8 => '', 9 => '' }
  end

  def insert(marker, position)
    @fields[position] = marker
  end

  def clear
    @fields = @fields.each do |position, _marker|
      @fields[position] = ''
    end
  end

  def check_lines(player)
    return true if check_horizontal(player)
    return true if check_vertical(player)
    return true if check_diagonal(player)

    false
  end

  def check_horizontal(player)
    @fields.values_at(1, 2, 3).all?(player) ||
    @fields.values_at(4, 5, 6).all?(player) ||
    @fields.values_at(7, 8, 9).all?(player)
  end

  def check_vertical(player)
    @fields.values_at(1, 4, 7).all?(player) ||
    @fields.values_at(2, 5, 8).all?(player) ||
    @fields.values_at(3, 6, 9).all?(player)
  end

  def check_diagonal(player)
    @fields.values_at(1, 5, 9).all?(player) ||
    @fields.values_at(3, 5, 7).all?(player)
  end


end
