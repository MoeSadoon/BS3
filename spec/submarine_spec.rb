require 'submarine'

describe Submarine do


  it "knows all positions when facing north" do
    sub = Submarine.new("B9", :N)
    sub.all_positions
    expect(sub.positions).to eq(['B9', 'B10'])
  end

  it "knows all positions when facing south" do
    sub = Submarine.new("B2", :S)
    sub.all_positions
    expect(sub.positions).to eq(['B2', 'B1'])
  end

  it "knows all positions when facing west" do
    sub = Submarine.new("B10", :W)
    sub.all_positions
    expect(sub.positions).to eq(['B10', 'C10'])
  end

  it "knows all positions when facing east" do
    sub = Submarine.new("B8", :E)
    sub.all_positions
    expect(sub.positions).to eq(['B8', 'A8'])
  end

  it 'can be hit in any of the positions it is in' do
    sub = Submarine.new('C4', :N)
    sub.all_positions
    expect(sub.hit('C5')).to eq('hit')
  end

end
