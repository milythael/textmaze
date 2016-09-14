class Player
  attr_accessor :current_maze, :current_location

  def travel_to_maze(maze)
    self.current_maze = maze
    self.current_location = maze.entrance
    self
  end

  def move_to(entrance_name)
    new_room = self.current_location.show_exit(entrance_name)
    self.current_location = new_room if new_room
  end
end
