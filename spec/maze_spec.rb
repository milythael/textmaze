require 'maze'

RSpec.describe Maze do
  describe "Blank Maze" do
    let(:empty_maze) { Maze.new }
    it "has no paths" do
      expect(empty_maze.rooms.length).to eq 0
    end
  end

  describe "Default Maze" do
    let(:default_maze) { Maze.default }

    it "should have 9 x 10 + 1 rooms" do
      expect(default_maze.rooms.length).to eq 91
    end

    it "should have an entrance" do
      expect(default_maze.entrance).to be_a Room
    end
  end
end
