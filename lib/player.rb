class Player
  attr_accessor :current_maze, :current_location

  def travel_to_maze(maze)
    self.current_maze = maze
    self.current_location = maze.entrance
    self
  end
end
