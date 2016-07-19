require_relative "pieces"
require 'colorize'

class Board #1. make grid 2.populate grid 3. moves pieces (if valid move from Pieces) 4. game over?
  # def self.populate_board(board)
  #   # create all the different pieces
  #   # place the 16 pieces on each side
  #   # place nil in remaining pos
  # end

  attr_accessor :grid
  def initialize(fill_board = true)
    @sentinel = NullPiece.instance.to_s
  make_starting_grid(fill_board)
    # Board.populate_board(@grid)
  end


  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def dup
    duped_board = Board.new(false)

    @grid.each_with_index do |row, i|
      row.each_with_index do |square,j|
        duped_board[[i, j]] = square
      end
    end
    duped_board
  end

  def empty?(pos)
  end

  def in_check?(color)
    king_pos = self.find_king(color)
    self.pieces.any? do |piece|
      (piece.color != color) && piece.moves.include?(king_pos)
    end
  end

  def move_piece(turn_color, start_pos, end_pos)
      # raise if start_pos.empty?
      # raise if end_pos is invalid move
      # else
      #delete the piece at board[start_pos]
      # board[end_pos] = piece
  end

  def move_piece!(from_pos, to_pos)
  end

  def pieces
    @grid.flatten.select {|piece| !piece.empty?}
  end

  def valid_pos?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  # protected

  def fill_back_row(color)
    row_num = color == :black ? 0 : 7

    @grid[row_num] = [Rook.new(color, self, [row_num, 0]),
                    Knight.new(color, self, [row_num, 1]),
                    Bishop.new(color, self, [row_num, 2]),
                    Queen.new(color, self, [row_num, 3]),
                    King.new(color, self, [row_num, 4]),
                    Bishop.new(color, self, [row_num, 5]),
                    Knight.new(color, self, [row_num, 6]),
                    Rook.new(color, self, [row_num, 7])]
  end

  def fill_pawns_row(color)
    row_num = color == :black ? 1 : 6
    @grid[row_num].map!.with_index { |square, idx| square = Pawn.new(color, self, [row_num, idx]) }
  end

  def find_king(color)
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, piece_idx|
        return piece if piece.is_a?(King) && piece.color == color
      end
    end

    "King not found!?!?!?!?"
  end

  def make_starting_grid(fill_board)
    if fill_board
      @grid = Array.new(8) { Array.new(8) { @sentinel } }
      fill_back_row(:white)
      fill_pawns_row(:white)
      fill_back_row(:black)
      fill_pawns_row(:black)
    end
  end

  private
  attr_reader :sentinel
end
