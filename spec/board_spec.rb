require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  let(:fields) { { 1=> "", 2=> "", 3=> "", 4=> "", 5=> "",
                    6=> "", 7=> "", 8=> "", 9=> "" } }

  it 'initializes with a blank set of fields' do
    expect(board.fields).to eq(fields)
  end


end
