# frozen_string_literal: true

require_relative 'board'
# Game class
class Game
  def initialize(board: nil)
    @board = board || Board.new
  end

  def over?
    @board.fields.value?('') ? false : true
  end

  def winner?(player)
    return player if player_wins?(player)
  end

  private

  def player_wins?(player)
    @board.check_lines(player)
  end
end
