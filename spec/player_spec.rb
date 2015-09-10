require 'player'

describe Player do

  it "will lose if all ships are hit" do
    # subject.place(Ship, 'A1', :N)
    # subject.receive_hit('A1')
    board = double(:board)
    allow(board).to receive(:all_sunk?).and_return(true)
    player = Player.new(board)
    expect(player).to be_lost

  end

  context "When receive hit" do
    it "is stored in hits if hit" do
      # board = double :board
      # allow(board).to receive(:receive_a_hit).with('E1') { :hit }
      # allow(shipklass).to receive(:new).and_return(ship)
      # allow(ship).to receive(:position)
      subject.place(Ship, 'E1', :N)
      subject.receive_hit('E1')
      expect(subject.hits).to include('E1')
    end

    it "is stored in misses if miss" do
      # allow(shipklass).to receive(:new).and_return(ship)
      # allow(ship).to receive(:position)
      #subject.place(shipklass, 'E1', :N)
      #subject.receive_hit('A1')
      board = double(:board)
      allow(board).to receive(:receive_a_hit).with('A1').and_return(:miss)
      player = Player.new(board)
      player.receive_hit('A1')
      expect(player.misses).to include('A1')
    end

    it "displays :hit if hit" do
      subject.place(Destroyer, 'C4', :N)
      expect(subject.receive_hit('C6')).to eq(:hit)
    end

    it "displays :miss if missed" do
      subject.place(Ship, 'C4', :N)
      expect(subject.receive_hit('B4')).to eq(:miss)
    end
  end

end

