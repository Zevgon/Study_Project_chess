require_relative "board"
require_relative "cursorable"
require_relative "pieces"
require "colorize"

class Display # make stuff pretty
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def build_grid
    # calls onto each row's each piece to colorizes into alternative colors
    @board.grid.map.with_index do |row, row_idx|
      build_row(row, row_idx)
    end
  end

  def build_row(row, row_idx)
    row.map.with_index do |piece, piece_idx|
      color_options = colors_for(row_idx, piece_idx)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    build_grid.each {|row| puts row.join}
  end

end
