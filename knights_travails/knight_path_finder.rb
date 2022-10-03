require_relative "poly_tree_node.rb"

class KnightPathFinder

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