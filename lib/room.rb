class Room
  def initialize(exits = {})
    @exits = exits
  end

  def show_exit(direction)
    @exits[direction]
  end

  def exits
    @exits.keys
  end

  def add_exit(direction, room)
    @exits[direction] = room
  end
end
