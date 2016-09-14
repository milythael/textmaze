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

      context "and entering the maze" do
        before do
          player.move_to(player.current_location.exits.first)
        end

        it "should be in the first room" do
          expect(player.current_location).not_to eq default_maze.entrance
        end
      end

      context "and moving to a room that does not exist" do
        before do
          player.move_to("not a real exit")
        end

        it "should remain in the entrance" do
          expect(player.current_location).to eq default_maze.entrance
        end
      end
    end
  end
end
