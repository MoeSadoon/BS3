require 'ship'

describe Ship do

  before :each do
    @ship = Ship.new('A1', :E)
  end

  it "increases number of hits when hit" do
    hit_num = @ship.hits.length
    @ship.hit('A1')
    expect(@ship.hits.length).to eq(hit_num+1)
  end

  it "is not sunk when created" do
    expect(@ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    @ship.was_hit('A1')
    expect(@ship).to be_sunk
  end

  it "cannot receive a hit in the same location twice" do 
    @ship.hit('A1')
    expect {@ship.hit('A1')}.to raise_error "Already hit location"

    
  end

end

