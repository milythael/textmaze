require 'maze'
require 'player'

class TextMaze
  attr_accessor :player, :maze, :playing
  def initialize
    self.playing = true
    self.player = Player.new
    self.maze = Maze.default
  end

  def play!
    unless player.current_maze
      puts ""
      print "Would you like to try a maze? (y/n) "
      try_maze = gets.chomp
      if try_maze == "y"
        player.travel_to_maze maze
      else
        self.playing = false
        return
      end
    end

    puts "You are currently in a room."
    puts "You see the following exits: #{player.current_location.exits}"
    print "Which way would you like to go? "
    direction = gets.chomp
    if player.move_to direction
      return
    else
      if direction == "QUIT"
        self.playing = false
        return
      end
      puts "I did not understand that.  Please try again. (QUIT to quit the game.)\n"
    end
  end

  def playing?
    playing
  end
end
