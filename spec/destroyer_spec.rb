require 'destroyer'

describe Destroyer do
  it "knows all positions when facing north" do
    d = Destroyer.new("B8", :N)
    d.all_positions
    expect(d.positions).to eq(['B8', 'B9', 'B10'])
  end

  it "knows all positions when facing south" do
    d = Destroyer.new("B8", :S)
    d.all_positions
    expect(d.positions).to eq(['B8', 'B7', 'B6'])
  end

  it "knows all positions when facing west" do
    d = Destroyer.new("C8", :W)
    d.all_positions
    expect(d.positions).to eq(['C8', 'D8', 'E8'])
  end

  it "knows all positions when facing east" do
    d = Destroyer.new("C8", :E)
    d.all_positions
    expect(d.positions).to eq(['C8', 'B8', 'A8'])
  end

  it "gets hit in any of the positions it is in" do
    d = Destroyer.new("C8", :E)
    d.all_positions
    expect(d.hit("A8")).to eq('hit')
  end

end