class Grid
  attr_reader :move_container

  def initialize
    @move_container = Array.new(3) { Array.new(3) }
  end

  def update_grid(row, column, symbol)
    @move_container[row][column] = symbol
  end

  def print_grid
    i = 0
    puts " |0|1|2|"
    @move_container.each do |x|
      print "#{i}|"
      x.each do |y|
        if y == nil
          print " |"
        else
          print "#{y}|"
        end
      end
      print "\n"
      i += 1
    end
  end
  
  def check_if_won
    for i in 0..2 do
      # row
      if @move_container[i][0] != nil
        if @move_container[i][0] == @move_container[i][1] && @move_container[i][1] == @move_container[i][2]
          return true
        end
      end
      # column
      if @move_container[0][i] != nil
        if @move_container[0][i] == @move_container[1][i] && @move_container[1][i] == @move_container[2][i]
          return true
        end
      end
    end
      
    
    # diagonal
    if @move_container[0][0] != nil
      if @move_container[0][0] == @move_container[1][1] && @move_container[1][1] == @move_container[2][2]
        return true
      end
    end
    
    if @move_container[2][0] != nil
      if @move_container[2][0] == @move_container[1][1] && @move_container[1][1] == @move_container[0][2]
        return true
      end
    end
    
    return false
  end

  def check_if_draw
    @move_container.each do |x|
      x.each do |y|
        if y == nil
          return false
        end
      end
    end
  return true
  end

  def clear_board
    @move_container.each do |x|
      x.each do |y|
        y = nil
      end
    end
  end

end


# Debugging
# board = Grid.new()
# board.print_grid