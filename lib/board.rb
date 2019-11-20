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
end
