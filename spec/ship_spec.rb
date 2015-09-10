require 'ship'

describe Ship do

  before :each do
    @ship = Ship.new('A1', :E)
  end

  it "increases number of hits when hit" do
    hit_num = @ship.hits
    @ship.hit('A1')
    expect(@ship.hits).to eq(hit_num+1)
  end

  it "is not sunk when created" do
    expect(@ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    @ship.was_hit
    expect(@ship).to be_sunk
  end

end

