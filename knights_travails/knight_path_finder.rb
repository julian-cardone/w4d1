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

  attr_reader :root_node, :position, :considered_positions

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

  def build_move_tree
    start_pos = root_node
    queue = [start_pos]

    until queue.empty?
      dequeued = queue.shift
      valid_moves = new_move_positions(dequeued.value)
      valid_moves.each do |move|
        node = PolyTreeNode.new(move)
        dequeued.add_child(node)
        queue.push(node)
      end
    end
  end

  def find_path(end_pos)

    found_node = root_node.bfs(end_pos)
    trace_path_back(found_node)

  end

  def trace_path_back(node)

    return [node.value] if node.parent.nil?

    trace_path_back(node.parent).push(node.value)

  end

end

knight = KnightPathFinder.new([0, 0])

# p knight
# p knight.considered_positions
# p knight.new_move_positions([0, 0])
# p knight.considered_positions
p knight.find_path([7,6])
p knight.find_path([6,2])
p 