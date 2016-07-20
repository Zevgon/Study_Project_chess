require_relative "display"

class Player
  def initialize(board)
    @display = Display.new(board)
  end

  def move # returns a
    from_pos, to_pos = nil, nil
    until from_pos && to_pos
      @display.render

      if from_pos
        # puts "#{color}'s turn. Move to where?"
        to_pos = @display.get_input

        # display.reset! if to_pos
      else
        # puts "#{color}'s turn. Move from where?"
        from_pos = @display.get_input

        # display.reset! if from_pos
      end
    end
    @display.board[to_pos] = @display.board[from_pos]
    @display.board[from_pos] = @display.board.sentinel
    @display.render

  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new

  # d = Display.new(b)
  a = Player.new(b)
  a.move
end
