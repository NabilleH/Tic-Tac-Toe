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

  subject(:game_three) { described_class.new(board: board_three) }
  let(:board_three) { double(:board, fields: fields_three) }
  let(:fields_three) do
    { 1 => 'X', 2 => 'X', 3 => 'X', 4 => '', 5 => '',
      6 => '', 7 => '', 8 => '', 9 => '' }
  end

  describe 'Game over' do
    it 'knows when the game is over with no winner' do
      expect(game_one.over?).to eq(true)
    end

    it 'knows when the game is NOT over' do
      expect(game_two.over?).to eq(false)
    end
  end

  # describe 'Winning a game' do
  #
  #   it "knows when X wins with a first line horizontal" do
  #     expect(game_three.winner?('X')).to eq('X')
  #   end
  # end
end
