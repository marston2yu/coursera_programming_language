# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
                rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
                [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long 4 (only needs two)
                 [[0, 0], [0, -1], [0, 1], [0, 2]]],
                rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
                rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
                rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
                rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
                rotations([[0, 0], [-1, 0], [1, 0], [0, -1], [1, -1]]), # @@
                                                                        # @@@
                [[[0, 0], [-1, 0], [1, 0], [2, 0], [-2, 0]], # long 5 (only needs two)
                 [[0, 0], [0, -1], [0, 1], [0, 2], [0, -2]]],
                rotations([[0, 0], [-1, 0], [0, -1]])] # small L
  # your enhancements here

  # block size
  def current_size
    @all_rotations[@rotation_index].length
  end

  def self.next_piece (board)
      MyPiece.new(All_Pieces.sample, board)
  end
end

class MyBoard < Board
  # your enhancements here

  def initialize (game)
    super
    @current_block = MyPiece.next_piece(self)
  end

  def rotate_180
    self.rotate_counter_clockwise
    self.rotate_counter_clockwise
    self.draw
  end

  # gets the next piece
  def next_piece
    if block_given?
      @current_block = MyPiece.next_piece(self) {}
    else
      @current_block = MyPiece.next_piece(self)
    end
    @current_pos = nil
  end

  # gets the information from the current piece about where it is and uses this
  # to store the piece on the board itself.  Then calls remove_filled.
  # modify to adapt different block size.
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..@current_block.current_size-1).each{|index|
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] =
          @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
end

class MyTetris < Tetris
  # your enhancements here
  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_180})
    @root.bind('c', proc {@board.cheat})
  end

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end
end