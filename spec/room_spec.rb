require 'room'
RSpec.describe Room do
  describe "Empty Room with No Doors" do
    let(:doorless) { Room.new }
    it "has no exits" do
      doorless.exits.length == 0
    end
  end
end
