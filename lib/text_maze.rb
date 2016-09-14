class TextMaze
  attr_accessor player, maze
  def initialize
    self.player = Player.new
    self.maze = Maze.default
  end
end
