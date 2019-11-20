# frozen_string_literal: true

# Game class
class Game
  def initialize(board: nil)
    @board = board || Board.new
  end

  def over?
    return true unless @board.fields.value?('')

    false
  end
end
