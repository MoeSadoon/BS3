require 'submarine'

describe Submarine do

  it "knows all positions when facing north" do
    sub = Submarine.new("B10", :N)
    expect(sub.all_positions).to eq(['B10', 'B9'])
  end

  it "knows all positions when facing south" do
    sub = Submarine.new("B2", :S)
    expect(sub.all_positions).to eq(['B2', 'B3'])
  end

  it "knows all positions when facing west" do
    sub = Submarine.new("B10", :W)
    expect(sub.all_positions).to eq(['B10', 'A10'])
  end

  it "knows all positions when facing east" do
    sub = Submarine.new("B8", :E)
    expect(sub.all_positions).to eq(['B8', 'C8'])
  end

  it 'can be hit in any of the positions it is in' do
    sub = Submarine.new('C4', :N)
    board = Board.new
    board.place sub
    expect(sub.hit('C3')).to eq('hit')
  end

end
