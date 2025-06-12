class MoveNode
  attr_reader :position, :parent

  MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]]

  def initialize(position, parent, visited)
    @position = position
    @parent = parent
    visited << position
    @visited = visited
  end

  def child
    result = []
    
    MOVES.each do |moves|
      pos_new = [@position[0] + moves[0], @position[1] + moves[1]]
      if valid_move?(pos_new) && !@visited.include?(pos_new)
        result << MoveNode.new(pos_new, self, @visited)
      end
    end

    result
  end

  def valid_move?(position)
    position[0].between?(0,7) && position[1].between?(0,7)
  end

end

def display_parent(node)
  unless node.parent.nil?
    display_parent(node.parent) 
  end
  p node.position
end

def knight_move(start_pos, end_pos)
  queue = []
  visited = []
  current_node = MoveNode.new(start_pos, nil, visited)
  queue << current_node

  until queue.empty?
    current_node = queue.shift 
    
    if current_node.position == end_pos
      break
    end
    
    current_node.child.each do |child|
      queue << child
    end
  end

  if current_node.position == end_pos
    display_parent(current_node)
  else
    puts "No path found from #{start_pos} to #{end_pos}!"
  end
end

knight_move([3, 3], [0, 0])