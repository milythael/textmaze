require 'player'
RSpec.describe Player do
  describe "New Player" do
    let(:player) { Player.new }
    it "should not have a current maze" do
      expect(player.current_maze).not_to be
    end

    it "should not have a current room" do
      expect(player.current_location).not_to be
    end

    context "after traveling to the maze" do
      let(:default_maze) { Maze.default }
      before do
        player.travel_to_maze default_maze
      end

      it "should have the default maze as the current maze" do
        expect(player.current_maze).to eq default_maze
      end

      it "should have the entrance of the default maze as the current_location" do
        expect(player.current_location).to eq default_maze.entrance
      end
    end
  end
end
