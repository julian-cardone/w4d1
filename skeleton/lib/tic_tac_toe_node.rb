require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children

    nodes = []

    (0...board.rows.length).each do |i|
      (0...board.rows.length).each do |j|
        pos = [i,j]
        if board.empty?(pos)
          temp_board = board.dup
          temp_board[pos] = next_mover_mark
          next_mark = next_mover_mark == :x ? :o : :x
          nodes << TicTacToeNode.new(temp_board, next_mark, pos)
        end
      end
    end
  nodes
  end
end

p t = TicTacToeNode.new(Board.new, :x)
 t.children.each {|ele| p ele}