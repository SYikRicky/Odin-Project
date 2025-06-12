require_relative 'Classes/player'
require_relative 'Classes/grid'

board = Grid.new()
puts "Player 1. What's your name?"
p1_name = gets.chomp
puts "Hi #{p1_name}!"
player1 = Cross_player.new(p1_name)
puts "Player 2. What's your name?"
p2_name = gets.chomp
puts "Hi #{p2_name}!"
player2 = Circle_player.new(p2_name)

puts "Choose your game mode. 1 Game or 3 Games? (Insert \"1\" or \"3\")"
game_mode = gets.chomp.to_i
if game_mode != 1 && game_mode != 3
  puts "Please insert a valid input."
end

puts "#{p1_name} vs #{p2_name}. Game Start!"

# loop until one of them get enough score
row, column = nil
while player1.score != game_mode && player2.score != game_mode
  # Player 1 round
  puts "Player 1. Your turn now."
  board.print_grid
  row, column = player1.get_player_move
  board.update_grid(row, column, player1.symbol)
  board.print_grid
  if board.check_if_won
    player1.won
    board.clear_board
    puts "Player 1 is won!"
    puts "Now the score: #{player1.score} : #{player2.score}"
    next
  elsif board.check_if_draw
    board.clear_board
    puts "The game is draw!"
    puts "Now the score: #{player1.score} : #{player2.score}"
    next
  end

  # Player 2 round
  puts "Player 2. Your turn now."
  board.print_grid
  row, column = player2.get_player_move
  board.update_grid(row, column, player2.symbol)
  board.print_grid
  if board.check_if_won
    player2.won
    board.clear_board
    puts "Player 2 is won!"
    puts "Now the score: #{player1.score} : #{player2.score}"
    next
  elsif board.check_if_draw
    board.clear_board
    puts "The game is draw!"
    puts "Now the score: #{player1.score} : #{player2.score}"
    next
  end

end