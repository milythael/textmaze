require 'room'
RSpec.describe Room do
  describe "Empty Room with No Doors" do
    let(:doorless) { Room.new }

    it "has no exits" do
      expect(doorless.exits.length).to eq 0
    end
  end

  describe "Empty Room with No Walls" do
    let(:wallless) do
      room = Room.new
      room.add_exit("north", room)
      room.add_exit("south", room)
      room.add_exit("east", room)
      room.add_exit("west", room)
    end

    it "has four exits" do
      expect(wallless.exits.length).to eq 4
    end

    it "has the right exits" do
      expect(wallless.exits).to contain_exactly("north", "east", "south", "west")
    end

    it "should return nothing for a non-existent direction" do
      expect(wallless.show_exit("in")).to eq nil
    end
  end

  describe "Two Connected Rooms" do
    let(:left) {Room.new}
    let(:right) {Room.new}

    before do
      left.add_exit("right", right)
      right.add_exit("left", left)
    end

    it "left room should have one exit" do
      expect(left.exits.length).to eq 1
    end

    it "right room should have one exit" do
      expect(right.exits.length).to eq 1
    end

    it "left should connect to right" do
      expect(left.exits[0]).to eq "right"
    end

    it "right should connect to left" do
      expect(right.exits[0]).to eq "left"
    end

    it "right room, left exit should lead to left room" do
      expect(right.show_exit(right.exits[0])).to eq left
    end
  end
end
