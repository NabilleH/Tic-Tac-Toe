# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:board_one) { described_class.new }
  let(:fields_one) do
    { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
      6 => '', 7 => '', 8 => '', 9 => '' }
  end

  subject(:board_two) { described_class.new }

  it 'initializes with a blank set of fields' do
    expect(board_one.fields).to eq(fields_one)
  end

  describe 'inserting a move' do
    it "inserts an 'X' into field 1" do
      board_one.insert('X', 1)
      expect(board_one.fields[1]).to eq('X')
    end

    it "inserts an 'O' into field 2" do
      board_one.insert('O', 2)
      expect(board_one.fields[2]).to eq('O')
    end
  end

  describe 'clearing the board' do
    it 'clears the board' do
      board_one.insert('X', 1)
      board_one.clear
      expect(board_one.fields).to eq(fields_one)
    end
  end

  describe 'check horizontal match' do
    it 'returns true if there is a first row horizontal match' do
      board_two.fields = { 1 => 'X', 2 => 'X', 3 => 'X', 4 => '', 5 => '',
                           6 => '', 7 => '', 8 => 'X', 9 => 'X' }
      expect(board_two.check_horizontal('X')).to eq(true)
    end

    it 'returns true if there is a second row horizontal match' do
      board_two.fields = { 1 => '', 2 => '', 3 => '', 4 => 'O', 5 => 'O',
                           6 => 'O', 7 => '', 8 => '', 9 => '' }
      expect(board_two.check_horizontal('O')).to eq(true)
    end

    it 'returns true if there is a third row horizontal match' do
      board_two.fields = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
                           6 => '', 7 => 'X', 8 => 'X', 9 => 'X' }
      expect(board_two.check_horizontal('X')).to eq(true)
    end

    it 'returns false if there is no horizontal match' do
      board_two.fields = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
                           6 => '', 7 => '', 8 => '', 9 => '' }
      expect(board_two.check_vertical('X')).to eq(false)
    end
  end

  describe 'check vertical match' do
    it 'returns true if there is a first column vertical match' do
      board_two.fields = { 1 => 'X', 2 => '', 3 => '', 4 => 'X', 5 => '',
                           6 => '', 7 => 'X', 8 => '', 9 => '' }
      expect(board_two.check_vertical('X')).to eq(true)
    end

    it 'returns true if there is a second column vertical match' do
      board_two.fields = { 1 => '', 2 => 'X', 3 => '', 4 => '', 5 => 'X',
                           6 => '', 7 => '', 8 => 'X', 9 => '' }
      expect(board_two.check_vertical('X')).to eq(true)
    end

    it 'returns true if there is a third column vertical match' do
      board_two.fields = { 1 => '', 2 => '', 3 => 'X', 4 => '', 5 => '',
                           6 => 'X', 7 => '', 8 => '', 9 => 'X' }
      expect(board_two.check_vertical('X')).to eq(true)
    end

    it 'returns false if there is no vertical match' do
      board_two.fields = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
                           6 => '', 7 => '', 8 => '', 9 => '' }
      expect(board_two.check_vertical('X')).to eq(false)
    end
  end

  describe 'check diagonal match' do
    it 'returns true if there is a left to right diagonal match' do
      board_two.fields = { 1 => 'X', 2 => '', 3 => '', 4 => '', 5 => 'X',
                           6 => '', 7 => '', 8 => '', 9 => 'X' }
      expect(board_two.check_diagonal('X')).to eq(true)
    end

    it 'returns true if there is a right to left diagonal match' do
      board_two.fields = { 1 => '', 2 => '', 3 => 'X', 4 => '', 5 => 'X',
                           6 => '', 7 => 'X', 8 => '', 9 => '' }
      expect(board_two.check_diagonal('X')).to eq(true)
    end

    it 'returns false if there is no diagonal match' do
      board_two.fields = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '',
                           6 => '', 7 => '', 8 => '', 9 => '' }
      expect(board_two.check_diagonal('X')).to eq(false)
    end
  end

  describe 'checking all lines for a win' do
    it 'returns true for a horizontal line match' do
      allow(board_two).to receive(:check_horizontal).and_return(true)
      expect(board_two.check_lines('X')).to eq(true)
    end

    it 'returns true for a vertical line match' do
      allow(board_two).to receive(:check_vertical).and_return(true)
      expect(board_two.check_lines('X')).to eq(true)
    end

    it 'returns true for a diagonal line match' do
      allow(board_two).to receive(:check_diagonal).and_return(true)
      expect(board_two.check_lines('X')).to eq(true)
    end

    it 'returns false for no matches' do
      allow(board_two).to receive(:check_horizontal).and_return(false)
      allow(board_two).to receive(:check_vertical).and_return(false)
      allow(board_two).to receive(:check_diagonal).and_return(false)
      expect(board_two.check_lines('X')).to eq(false)
    end
  end
end
