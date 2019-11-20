require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  let(:fields) { { 1=> "", 2=> "", 3=> "", 4=> "", 5=> "",
                    6=> "", 7=> "", 8=> "", 9=> "" } }

  it 'initializes with a blank set of fields' do
    expect(board.fields).to eq(fields)
  end

  describe "inserting a move" do

    it "inserts an 'X' into field 1" do
      board.insert("X", 1)
      expect(board.fields[1]).to eq("X")
    end

    it "inserts an 'O' into field 2" do
      board.insert("O", 2)
      expect(board.fields[2]).to eq("O")
    end
  end

  describe "clearing the board" do

    it "clears the board" do
      board.insert("X", 1)
      board.clear
      expect(board.fields).to eq(fields)
    end
  end

end
