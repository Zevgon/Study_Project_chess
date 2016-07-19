require_relative "display"

class Player
  def initialize(board)
    @display = Display.new(board)
  end

  def move # returns a
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new

  # d = Display.new(b)
  a = Player.new(b)
  a.move
end
