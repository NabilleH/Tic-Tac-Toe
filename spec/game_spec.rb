# frozen_string_literal: true

require './lib/game'

describe Game do
  subject(:game_one) { described_class.new(board: board_one) }
  let(:board_one) { double(:board, fields: fields_one) }
  let(:fields_one) do
    { 1 => 'X', 2 => 'X', 3 => 'O', 4 => 'O', 5 => 'X',
      6 => 'X', 7 => 'X', 8 => 'O', 9 => 'O' }
  end

  subject(:game_two) { described_class.new(board: board_two) }
  let(:board_two) { double(:board, fields: fields_two) }
  let(:fields_two) do
    { 1 => '', 2 => 'X', 3 => 'O', 4 => 'O', 5 => 'X',
      6 => 'X', 7 => 'X', 8 => 'O', 9 => '' }
  end

  describe 'Game over' do
    it 'knows when the game is over with no winner' do
      expect(game_one.game_over?).to eq(true)
    end

    it 'knows when the game is NOT over' do
      expect(game_two.game_over?).to eq(false)
    end
  end

  describe 'Player wins' do
    it 'returns true if player X has won' do
      allow(board_one).to receive(:check_lines).and_return(true)
      expect(game_one.player_wins?('X')).to eq(true)
    end

    it 'returns false if player X has not yet won' do
      allow(board_one).to receive(:check_lines).and_return(false)
      expect(game_one.player_wins?('X')).to eq(false)
    end
  end

  describe 'play' do
    it 'checks when a player has won and resets the game' do
      allow(game_one).to receive(:invalid_move?).and_return(false)
      allow(board_one).to receive(:insert)
      allow(board_one).to receive(:clear)
      allow(game_one).to receive(:player_wins?).and_return(true)
      expect(game_one.play(1)).to eq('X wins!')
    end

    it 'checks when a player has won and resets the game' do
      allow(game_one).to receive(:invalid_move?).and_return(false)
      allow(board_one).to receive(:insert)
      allow(board_one).to receive(:clear)
      allow(game_one).to receive(:player_wins?).and_return(false)
      allow(game_one).to receive(:game_over?).and_return(true)
      expect(game_one.play(1)).to eq('Game is a draw')
    end
  end
end
