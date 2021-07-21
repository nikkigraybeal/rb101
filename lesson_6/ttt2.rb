require "pry-byebug"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "   #{brd[7]} |   #{brd[8]} |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{remaining_squares(brd)}):")
    square = gets.chomp.to_i
    break if brd.keys.include?(square) && brd[square] == INITIAL_MARKER
    puts "Sorry, that's not a valid option"
  end
  brd[square] = PLAYER_MARKER
end

def computer_strategy(brd)
  square = []
  player_squares = brd.select { |_, v| v == PLAYER_MARKER }.keys
  computer_squares = brd.select { |_, v| v == COMPUTER_MARKER }.keys
  WINNING_COMBOS.each do |arr| 
    offense = computer_squares.select { |num| arr.include?(num) }
    available_square = arr - offense
    if offense.size == 2 && !player_squares.include?(available_square[0]) 
      square = available_square
    end
  end
  if square[0] != nil
    square[0]
  elsif
    WINNING_COMBOS.each do |arr|
      defense = player_squares.select { |num| arr.include?(num) }
      available_square = arr - defense
      if defense.size == 2 && !computer_squares.include?(available_square[0])
        square = available_square
      end
    end
    if square[0] != nil
      square[0]
    elsif !player_squares.include?(5) && !computer_squares.include?(5)
      square = 5
      square 
    end
  end
end


def computer_places_piece!(brd)
  remaining_squares = brd.select { |_, v| v == ' ' }.keys
  square = computer_strategy(brd)
  if square != nil && remaining_squares.include?(square)
    square
  else
    square = remaining_squares.sample
  end
  brd[square] = COMPUTER_MARKER
end

def joinor(arr, delimiter = ',')
  if arr.size < 2
    arr.join()
  else
    arr.insert(-2, 'or') 
    arr2 = arr.map do |num|
      if num == arr[-1] || num == arr[-2]
        num
      else
        "#{num}#{delimiter}"
      end
    end
    arr2.join(' ')
  end
end

def remaining_squares(brd)
  sq_arr = brd.select { |_, v| v == ' ' }.keys
  joinor(sq_arr)
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winner = nil
  player_squares = brd.select { |_, v| v == PLAYER_MARKER }.keys
  computer_squares = brd.select { |_, v| v == COMPUTER_MARKER }.keys
  WINNING_COMBOS.each do |arr|
    player_wins = player_squares.select { |num| arr.include?(num) }
    computer_wins = computer_squares.select { |num| arr.include?(num) }
    if player_wins.size == 3
      winner = 'player'
    elsif computer_wins.size == 3
      winner = 'computer'
    end
  end
  winner
end

def board_full?(brd)
  !brd.values.include?(' ')
end

def play(brd)
  loop do
    display_board(brd)
    player_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)
    computer_places_piece!(brd)
    break if  someone_won?(brd) || board_full?(brd)
  end
  display_board(brd)
  if detect_winner(brd) == 'player'
    puts "You won!"
  elsif detect_winner(brd) == 'computer'
    puts "The computer won!"
  else
    puts "It's a tie!"
  end
end


loop do
  pwin = 0
  cwin = 0
  loop do
    prompt('press any key to continue')
    answer = gets.chomp
    if answer =~ /./
      board = initialize_board
      play(board)
      if detect_winner(board) == 'player'
        pwin += 1
        puts "player score: #{pwin}"
        puts "computer score: #{cwin}"
      elsif detect_winner(board) == 'computer'
        cwin += 1
        puts "player score: #{pwin}"
        puts "computer score: #{cwin}"
      end
      if pwin == 5
        puts 'You won the match!'
        break
      elsif cwin == 5
        puts 'The computer won the match!'
        break
      end
    end 
  end
 
  puts "Would you like to play again? y/n"
  answer = gets.chomp
  break unless answer == 'y'
end

puts "Thanks for playing Tic Tac Toe! Goodbye!"

