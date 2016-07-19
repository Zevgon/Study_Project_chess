class Piece
  attr_reader :color

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end

  def remove_checked_pos_from_poss_moves
    moves.reject{|move| move_into_check(move)}
  end

  private

  def move_into_check?(to_pos)
    # pretend to move to board.dup
    duped = @board.dup
    # if board.dup is now in_check?
      # then reject that move
      #
  end

end
