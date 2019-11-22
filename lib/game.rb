# frozen_string_literal: true

require_relative 'board'
# Game class
class Game
  attr_accessor :player

  def initialize(board: nil)
    @board = board || Board.new
    @player = 'X'
  end

  def play(position)
    return if invalid_move?(position)

    @board.insert(player, position)

    game_over? ? reset_game : update_turn
  end

  private

  def player_wins?(player)
    @board.check_lines(player)
  end

  def game_over?
    return true if player_wins?(player) || @board.board_full?
  end

  def invalid_move?(position)
    return true if position < 1 || position > 9
    return true unless position.is_a?(Integer)
    return true if @board.field_unavailable?(position)

    false
  end

  def reset_game
    @board.clear
    @player = 'X'
    true
  end

  def update_turn
    @player = @player == 'X' ? 'O' : 'X'
    false
  end
end
