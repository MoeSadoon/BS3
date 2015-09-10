require 'board'
describe Board do

  it "can place a ship on it" do
    ship = Ship.new('A1', :N)
    subject.place(ship)
    expect(subject.ships).to include(ship)
  end

  it "can report :hit" do
    ship = Ship.new('A1', :N)
    subject.place(ship)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    ship = Ship.new('A1', :N)
    subject.place(ship)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
  end

  it "reports if all ships are sunk" do
    ship1 = Ship.new('A1', :N)
    ship2 = Ship.new('B1', :N)
    subject.place(ship1)
    subject.place(ship2)
    subject.receive_a_hit('A1')
    subject.receive_a_hit('B1')
    expect(subject).to be_all_sunk
  end

  it "reports if not all ships are sunk" do
    ship1 = Ship.new('A1', :N)
    ship2 = Ship.new('B1', :N)
    subject.place(ship1)
    subject.place(ship2)
    subject.receive_a_hit('A1')
    expect(subject).not_to be_all_sunk
  end

  it 'does not allow ships to overlap' do
    ship1 = Ship.new('A1', :N)
    ship2 = Ship.new('A1', :N)
    subject.place(ship1)
    expect{subject.place(ship2)}.to raise_error 'Overlap'
  end

  it 'does not allow submarines to overlap' do
    sub1 = Submarine.new('A2', :N)
    sub2 = Submarine.new('A3', :N)
    subject.place(sub1)
    expect{subject.place(sub2)}.to raise_error 'Overlap'
  end

  it "does not allow ships outside the board" do
    d = Destroyer.new('A1', :S)
    expect{subject.place(d)}.to raise_error "Outside the board"
  end

end


