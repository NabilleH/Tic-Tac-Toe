# frozen_string_literal: true

require_relative 'board'
# Game class
class Game
  attr_accessor :player

  def initialize(board: nil)
    @board = board || Board.new
    @player = 'X'
  end

  def game_over?
    @board.fields.value?('') ? false : true
  end

  def player_wins?(player)
    @board.check_lines(player)
  end

  def play(position)
    return if invalid_move?(position)

    @board.insert(player, position)
    if player_wins?(player)
      reset_game
      return "#{player} wins!"
    elsif game_over?
      reset_game
      return 'Game is a draw'
    end

    update_turn
  end

  private

  def invalid_move?(position)
    return true if position < 1 || position > 9
    return true unless position.is_a?(Integer)
    return true if @board.fields[position] != ''

    false
  end

  def reset_game
    @board.clear
    @player = 'X'
  end

  def update_turn
    @player = @player == 'X' ? 'O' : 'X'
  end
end
