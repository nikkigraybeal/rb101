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

def computer_places_piece!(brd)
  square = brd.select { |_, v| v == ' ' }.keys.sample
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



def check_for_winner(brd)
  winner = ''
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


def play(brd)
  winner = ''
  loop do
    player_places_piece!(brd)
    computer_places_piece!(brd)
    display_board(brd)
    winner = check_for_winner(brd)
    if winner == 'player'
      puts 'You win!'
      break
    elsif winner == 'computer'
      puts 'Computer wins!'
      break
    elsif !brd.values.include?(' ')
      puts "It's a tie!"
      break
    end
  end
end

def match_play(pwin, cwin)
  board = initialize_board
  display_board(board)
  play(board)
  winner = check_for_winner(board)
  if winner == 'player'
    pwins += 1
    pwins
    puts "player score: #{player_wins}"
    puts "computer score: #{computer_wins}"
  elsif winner == 'computer'
    cwins += 1
    cwins
    puts "player score: #{player_wins}"
    puts "computer score: #{computer_wins}"
  end
end

loop do
  player_wins = 0
  computer_wins = 0
  loop do
    prompt("ready?")
    answer = gets.chomp
    if answer =~ /[A-Za-z0-9]/
      board = initialize_board
      display_board(board)
      play(board)
      winner = check_for_winner(board)
      if winner == 'player'
        player_wins += 1
        puts "player score: #{player_wins}"
        puts "computer score: #{computer_wins}"
      elsif winner == 'computer'
        computer_wins += 1
        puts "player score: #{player_wins}"
        puts "computer score: #{computer_wins}"
      end
    end
    if player_wins == 5 
      puts "You won the match!"
      break
    elsif computer_wins == 5
      puts "The computer won the match!"
      break
    end
  end
  puts "Would you like to play again? y/n"
  answer = gets.chomp
  break unless answer == 'y'
end

puts "Thanks for playing Tic Tac Toe! Goodbye!"
