require_relative "poly_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)

        moves = []

        [-2,2].each do |i|
            [-1,1].each do |j|
                new_pos = [pos[0] + i, pos[1] + j]
                moves << new_pos
                new_pos2 = [pos[0] + j, pos[1] + i]
                moves << new_pos2
            end
        end
        moves.select do |pos|
            pos.all? {|i| i.between?(0,7)}
        end
    end

    attr_reader :position

    def  initialize(pos)
        @position = pos
        @root_node = PolyTreeNode.new(pos)
        build_move_tree
    end

    def build_move_tree

    end

    def find_path

    end
    
end

p KnightPathFinder.valid_moves([0, 0])