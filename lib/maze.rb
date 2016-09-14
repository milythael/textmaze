require 'set'
require 'room'
require 'default_maze_builder'

class Maze
  attr_accessor :rooms, :entrance

  def initialize
    @rooms = Set.new
  end

  def self.default
    DefaultMazeBuilder.new.build
  end
end
