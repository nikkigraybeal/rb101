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

def possible_computer_moves(arr)
  block_or_win = []
  WINNING_COMBOS.each do |winarr|
    occupied = arr.select { |num| winarr.include?(num) } # occupied squares
    possible_moves = winarr - occupied
    if possible_moves.size == 1
      block_or_win << possible_moves[0]
    end
  end
  block_or_win
end

def offense_defense(arr1, arr2)
  square = []
  block = possible_computer_moves(arr1) - arr2
  win = possible_computer_moves(arr2) - arr1
  if !win[0].nil?
    square = win
  elsif !block[0].nil?
    square = block
  end
  square[0]
end

def computer_strategy(brd)
  player_squares = brd.select { |_, v| v == PLAYER_MARKER }.keys
  computer_squares = brd.select { |_, v| v == COMPUTER_MARKER }.keys
  square = offense_defense(player_squares, computer_squares)
  if !square.nil?
    square
  elsif !player_squares.include?(5) && !computer_squares.include?(5)
    square = 5
    square
  end
end

def joinor(arr, delimiter = ',')
  if arr.size < 2
    arr.join
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
    player_wins.size == 3 ? winner = 'player' : winner
    computer_wins.size == 3 ? winner = 'computer' : winner
  end
  winner
end

def board_full?(brd)
  !brd.values.include?(' ')
end

def alternate_players(current_player)
  current_player == 'me' ? 'computer' : 'me'
end

def validate_input(brd)
  square = ''
  loop do
    prompt("Choose a square (#{remaining_squares(brd)}):")
    square = gets.chomp.to_i
    break if brd.keys.include?(square) && brd[square] == INITIAL_MARKER
    puts "Sorry, that's not a valid option"
  end
  square
end

def place_piece!(brd, current_player)
  if current_player == 'me'
    square = validate_input(brd)
    brd[square] = PLAYER_MARKER
  else
    remaining_squares = brd.select { |_, v| v == ' ' }.keys
    square = computer_strategy(brd)
    if remaining_squares.include?(square)
      square
    else
      square = remaining_squares.sample
    end
    brd[square] = COMPUTER_MARKER
  end
end

def whose_first
  prompt("Choose who chooses to go first. Enter 'me' or 'computer'")
  answer = gets.chomp
  if answer == 'me'
    prompt("Choose who goes first. Enter 'me' or 'computer'.")
    answer = gets.chomp
  else
    players = ['computer', 'me']
    answer = players.sample
  end
  answer
end

def play(brd)
  answer = whose_first
  loop do
    display_board(brd)
    place_piece!(brd, answer)
    answer = alternate_players(answer)
    break if someone_won?(brd) || board_full?(brd)
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

  puts "Would you like to play again? y/n"
  answer = gets.chomp
  break unless answer == 'y'
end

puts "Thanks for playing Tic Tac Toe! Goodbye!"
