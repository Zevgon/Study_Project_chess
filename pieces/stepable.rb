module Stepable

  def moves
    cur_x, cur_y = pos
    maybe_moves = move_diffs.map { |poss_pos| poss_pos[0] += cur_x ; poss_pos[1] += cur_y}
    all_poss_moves_from_cur_pos = maybe_moves.select do |pos|
      board.valid_pos?(pos) &&
        (board.empty?(pos) || board[pos].color != color)
    end
  end

end
