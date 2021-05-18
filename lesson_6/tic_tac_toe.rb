INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CENTER_SQUARE = 5
BOARD_SIZE = 3
WINNING_SCORE = 5
PLAYER = [/\Am\Z/i, /\Ame\Z/i]
COMPUTER = [/\Ac\Z/i, /\Acomputer\Z/i]
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]
SCORES = { computer: 0, player: 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  clear_screen
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
# rubocop:enable Metrics/AbcSize

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

def find_squares(brd, marker)
  brd.select { |_, square| square == marker }.keys
end

def computer_strategy(brd)
  player_squares = find_squares(brd, PLAYER_MARKER)
  computer_squares = find_squares(brd, COMPUTER_MARKER)
  square = offense_defense(player_squares, computer_squares)
  if !square.nil?
    square
  else square = CENTER_SQUARE
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
  sq_arr = find_squares(brd, INITIAL_MARKER)
  joinor(sq_arr)
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winner = nil
  player_squares = find_squares(brd, PLAYER_MARKER)
  computer_squares = find_squares(brd, COMPUTER_MARKER)
  WINNING_COMBOS.each do |arr|
    player_wins = player_squares.select { |num| arr.include?(num) }
    computer_wins = computer_squares.select { |num| arr.include?(num) }
    winner = 'player' if player_wins.size == BOARD_SIZE
    winner = 'computer' if computer_wins.size == BOARD_SIZE
  end
  winner
end

def board_full?(brd)
  !brd.values.include?(INITIAL_MARKER)
end

def alternate_players(current_player)
  current_player == 'me' ? 'computer' : 'me'
end

def check_float(str)
  loop do
    break unless str.split('').include?('.')
    prompt('Please enter a whole number.')
    str = gets.chomp
  end
  str.to_i
end

def validate_input(brd)
  square = ''
  loop do
    prompt("Choose a square (#{remaining_squares(brd)}):")
    square = gets.chomp
    square = check_float(square)
    break if brd.keys.include?(square) && brd[square] == INITIAL_MARKER
    puts "That's not a valid option. Please try again."
  end
  square
end

def place_piece!(brd, current_player)
  if current_player == 'me'
    square = validate_input(brd)
    brd[square] = PLAYER_MARKER
  else
    remaining_squares = find_squares(brd, INITIAL_MARKER)
    square = computer_strategy(brd)
    if remaining_squares.include?(square)
      square
    else
      square = remaining_squares.sample
    end
    brd[square] = COMPUTER_MARKER
  end
end

def in_obj?(obj, str)
  obj.any? { |pattern| pattern.match?(str) }
end

def whose_first
  answer = ''
  loop do
    prompt("Choose who goes first. Enter 'me' or 'computer'.")
    answer = gets.chomp
    if in_obj?(COMPUTER, answer)
      answer = 'computer'
    elsif in_obj?(PLAYER, answer)
      answer = 'me'
    end
    break if answer == 'me' || answer == 'computer'
    prompt("Sorry, that's not a valid option")
  end
  answer
end

def computer_chooses
  players = ['computer', 'me']
  answer = players.sample
  answer
end

def big_decisions
  answer = ''
  loop do
    prompt("Choose who chooses to go first. Enter 'me' or 'computer'")
    answer = gets.chomp
    if in_obj?(PLAYER, answer)
      answer = whose_first
      break
    elsif in_obj?(COMPUTER, answer)
      answer = computer_chooses
      break
    else prompt("Sorry, that's not a valid option.")
    end
  end
  answer
end

def display_round_result(brd)
  if detect_winner(brd) == 'player'
    puts "You won!"
  elsif detect_winner(brd) == 'computer'
    puts "The computer won!"
  else
    puts "It's a tie!"
  end
end

def play_round(brd)
  answer = big_decisions
  loop do
    display_board(brd)
    place_piece!(brd, answer)
    answer = alternate_players(answer)
    break if someone_won?(brd) || board_full?(brd)
  end
  display_board(brd)
  display_round_result(brd)
end

def play_again?
  yes = [/\Ay\Z/i, /\Ayes\Z/i]
  no = [/\An\Z/i, /\Ano\Z/i]
  answer = ''
  loop do
    puts "Would you like to play again? y/n"
    answer = gets.chomp
    if in_obj?(yes, answer) || in_obj?(no, answer)
      break
    end
    prompt("Sorry, that's not a valid option.")
  end
  in_obj?(yes, answer) ? true : false
end

def display_match_results(scr_hsh)
  scr_hsh.each do |player, score|
    next unless score == 5
    puts "#{player.to_s.capitalize} won the match!"
  end
end

def update_scores(scr_hsh, winner)
  scr_hsh[winner.to_sym] += 1
end

def display_scores(scr_hsh)
  scr_hsh.each do |player, score|
    puts "#{player} score: #{score}"
  end
end

def someone_won_match?(scr_hsh)
  scr_hsh.any? { |_, score| score == 5 }
end

def reset_scores(scr_hsh)
  scr_hsh.transform_values! { |score| score - score }
end

loop do
  clear_screen
  prompt('Welcome to Tic Tac Toe!')
  prompt('First player to get 3 in a row wins the round,
          best out of 5 wins the match!')
  prompt('Good luck!')
  loop do
    board = initialize_board
    play_round(board)
    winner = detect_winner(board)
    next if winner.nil?
    update_scores(SCORES, winner)
    display_scores(SCORES)
    break if someone_won_match?(SCORES)
  end
  display_match_results(SCORES)
  reset_scores(SCORES)
  break unless play_again?
end

puts "Thanks for playing Tic Tac Toe! Goodbye!"
