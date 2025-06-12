class Player
  attr_reader :symbol, :score, :name

  # Return player input
  def get_player_move
      puts "What's your next move? (Fromat: row, column) : "
      row, column = gets.chomp().split(',')
      row = row.to_i
      column = column.to_i
      p row
      p column
    
    while (row.is_a?(Integer) == false) && (column.is_a?(Integer) == false)
      puts "Invalid input."
      puts "What's your next move? (Fromat: row, column) : "
      row, column = gets.chomp().split(',')
    end 

    puts ("\n Your next move is #{row},#{column}")
    return row, column
  end

  # Add score
  def won
    @score = @score + 1
  end

end

class Cross_player < Player
  def initialize(name)
    @score = 0
    @name = name
    @symbol = "X"
  end
end

class Circle_player < Player
  def initialize(name)
    @score = 0
    @name = name
    @symbol = "O"
  end
end

# Debug
# a = Player.new
# b = Player.new
# a.won
# b.won


