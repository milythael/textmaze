class DefaultMazeBuilder
  def init_row
    [Room.new, Room.new, Room.new, Room.new, Room.new, Room.new, Room.new, Room.new, Room.new]
  end

  # row(#, NESW, NESW, NESW, NESW, NESW, NESW, NESW, NESW, NESW)
  # in the 4 digit numbers, 1 = wall, 0 = opening
  def row(rooms, outside, rownum, *exits)
    exits.each_with_index do |nesw, index|
      room = rooms[rownum][index]
      n = nesw[0]
      e = nesw[1]
      s = nesw[2]
      w = nesw[3]

      room.add_exit("north", rooms[rownum - 1][index]) if n == "0"
      room.add_exit("north", outside) if n == "E"

      room.add_exit("east", rooms[rownum][index + 1]) if e == "0"
      room.add_exit("east", outside) if e == "E"

      room.add_exit("south", rooms[rownum + 1][index]) if s == "0"
      room.add_exit("south", outside) if s == "E"

      room.add_exit("west", rooms[rownum][index - 1]) if w == "0"
      room.add_exit("west", outside) if w == "E"
    end
  end

  def build
    maze = Maze.new
    outside = Room.new
    rooms = [init_row, init_row, init_row, init_row, init_row, init_row, init_row, init_row, init_row, init_row ]

    row(rooms, outside, 0, "1101", "1001", "1010", "1010", "1010", "1010", "1000", "1010", "1100")
    row(rooms, outside, 1, "0101", "0101", "1011", "1100", "1011", "1010", "0110", "1101", "0101")
    row(rooms, outside, 2, "0101", "0011", "1100", "0011", "1010", "1010", "1000", "0100", "0101")
    row(rooms, outside, 3, "0101", "1001", "0100", "1011", "1010", "1000", "0100", "0001", "0100")
    row(rooms, outside, 4, "0101", "0101", "0001", "1010", "1010", "0100", "0101", "0101", "0101")
    row(rooms, outside, 5, "0101", "0101", "0101", "1001", "1110", "0101", "0101", "0111", "0101")
    row(rooms, outside, 6, "0101", "0101", "0101", "0001", "1010", "0110", "0001", "1010", "0100")
    row(rooms, outside, 7, "0101", "0101", "0111", "0101", "1001", "1010", "0110", "1101", "0101")
    row(rooms, outside, 8, "0101", "0011", "1100", "0101", "0011", "1010", "1000", "0110", "0101")
    row(rooms, outside, 9, "0011", "1010", "0110", "0011", "1010", "1010", "00E0", "1010", "0110")

    outside.add_exit("enter", rooms[9][6])

    maze.rooms = rooms.flatten.to_set
    maze.rooms.add(outside)
    maze.entrance = outside
    maze
  end
end
