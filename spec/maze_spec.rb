require 'maze'
RSpec.describe Maze do
  describe "Blank Maze" do
    let(:empty_maze) { Maze.new }
    it "has no paths" do
      expect(empty_maze.rooms.length).to eq 0
    end
  end
end
