require_relative 'poly_tree_node'

class KnightPathFinder
  def self.valid_moves(pos)
    moves = []

    [-2, 2].each do |i|
      [-1, 1].each do |j|
        new_pos = [pos[0] + i, pos[1] + j]
        moves << new_pos
        new_pos2 = [pos[0] + j, pos[1] + i]
        moves << new_pos2
      end
    end
    moves.select do |new_pos|
      new_pos.all? { |i| i.between?(0, 7) }
    end
  end

  attr_reader :position, :considered_positions

  def initialize(pos)
    @position = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    build_move_tree
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_moves = valid_moves.select { |valid_move| !@considered_positions.include?(valid_move) }
    considered_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree; end

  def find_path; end
end

knight = KnightPathFinder.new([0, 0])
p knight.considered_positions
p knight.new_move_positions([0, 0])
p knight.considered_positions

# p KnightPathFinder.valid_moves([0, 0])
