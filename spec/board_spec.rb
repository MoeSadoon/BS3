require 'board'
describe Board do

  it "can place a ship on it" do
    ship = instance_double('Ship', :start_position => 'A1', :direction => :N, :positions => ["A1"])
    allow(ship).to receive(:all_positions)
    subject.place(ship)
    expect(subject.ships).to include(ship)
  end

  it "can report :hit" do
    ship = instance_double('Ship', :start_position => 'A1', :direction => :N, :positions => ["A1"])
    allow(ship).to receive(:all_positions)
    allow(ship).to receive(:hit).with("A1") {'hit'}
    subject.place(ship)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    ship = instance_double('Ship', :start_position => 'A1', :direction => :N, :positions => ["A1"])
    allow(ship).to receive(:all_positions)
    allow(ship).to receive(:hit).with("A2") {'miss'}
    subject.place(ship)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
  end

  it "reports if all ships are sunk" do

    ship1 = instance_double('Ship', :start_position => 'A1', :direction => :N, :positions => ["A1"])
    allow(ship1).to receive(:all_positions)
    allow(ship1).to receive(:hit).with("A1") {'hit'}
    allow(ship1).to receive(:hit).with("B1") {'miss'}
    allow(ship1).to receive(:sunk?) {true}

    ship2 = instance_double('Ship', :start_position => 'B1', :direction => :N, :positions => ["B1"])
    allow(ship2).to receive(:all_positions)
    allow(ship2).to receive(:hit).with("B1") {'hit'}
    allow(ship2).to receive(:hit).with("A1") {'miss'}
    allow(ship2).to receive(:sunk?) {true}

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


