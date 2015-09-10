require 'player'

describe Player do

  # let(:shipklass) { double 'Ship', new: :ship }
  # let(:ship) { instance_double('ship') }
  # let(:shipklass) { class_double('Ship') }
  # let(:board) { double :board }
  #
  # it "can place a ship on the board" do
  #   expect{Player.new(boardklass).place(shipklass, 'E9', :N}.to change(Player.new(boardklass).board.ships.count}.by(1)
  # end
  #
  # it "can display information about the ships on the board" do
  #   Player.new(boardklass).place(shipklass, 'E9', :N)
  #   expect(Player.new(baordklass).board.ships).to include(ship)
  # end

  # it "can place a ship on the board" do
  #   allow(shipklass).to receive(:new).and_return(ship)
  #   expect{subject.place(shipklass, 'E1', :N)}.to change{subject.board.ships.count}.by(1)
  # end

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
  end






  # describe "#receive_hit(position)" do
  #   context "When hit" do
  #     it "displays :hit" do
  #       subject.place(Ship, 'C4', :N)
  #       expect(subject.receive_hit('C4')).to eq(:hit)
  #     end
  #   end
  #   context "When not hit" do
  #     it "displays :miss" do
  #       subject.place(Ship, 'C4', :N)
  #       expect(subject.receive_hit('B4')).to eq(:miss)
  #     end
  #   end
  # end
end
