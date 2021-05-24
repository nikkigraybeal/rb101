require "pry-byebug"
CARD_VALUES = { 'Ace' => 11, 'Two' => 2, 'Three' => 3, 'Four' => 4,
                'Five' => 5, 'Six' => 6, 'Seven' => 7, 'Eight' => 8,
                'Nine' => 9, 'Ten' => 10, 'Jack' => 10, 'Queen' => 10,
                'King' => 10 }

SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

TARGET_SCORE = 21

DEALER_STAYS = 17

WINS_PER_SHUFFLE = 5

REPLAY = { 'yes' => [/\Ay\Z/i, /\Ayes\Z/i],
           'no' => [/\An\Z/i, /\Ano\Z/i] }

HIT_OR_STAY = { 'hit' => [/\Ah\Z/i, /\Ahit\Z/i],
                'stay' => [/\As\Z/i, /\Astay\Z/i] }

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "=>#{msg}"
end

def display_welcome
  prompt("Welcome to #{TARGET_SCORE}! If you know how to play,
  press any key then return to begin, otherwise enter 'rules'
  to learn how to play.")
  gets.chomp
end

def enter_to_continue
  puts "\n\nPress any key then return to continue."
  gets.chomp
end

# rubocop:disable Metrics/MethodLength
def show_rules
  prompt(
    "Players are each dealt two cards. While the dealer
    is also dealt two cards only one is exposed and the other
    is hidden. 
    
    The value of cards two through ten is their pip
    value (2 through 10). Face cards (Jack, Queen, and King) are
    all worth ten. Aces can be worth one or eleven.
    
    A hand's value is the sum of the card values. The better hand is
    the hand where the sum of the card values is closer to #{TARGET_SCORE}
    without exceeding #{TARGET_SCORE}. Players are allowed to 'hit'
    (draw additional cards) to improve their hands.
  
    After the players have drawn enough cards that they are either
    satisfied with their card total or have exceeded #{TARGET_SCORE}, it is
    the dealer's turn. The dealer must draw cards until the cards total up to
    #{DEALER_STAYS} points. At #{DEALER_STAYS} points or higher the dealer
    must stop.
  
    If the player exceeds a sum of #{TARGET_SCORE} ('busts'), the player loses.
    If the dealer exceeds #{TARGET_SCORE} ('busts') and the player does not,
    the player wins.
    If the player attains a final sum higher than the dealer and
    does not bust, the player wins.
    If both dealer and player receive a #{TARGET_SCORE} or any other hands
    with the same sum, this will be called a 'push' and no one wins.
    
    First to #{WINS_PER_SHUFFLE} wins the match.\n\n")
  
end
# rubocop:enable Metrics/MethodLength

def initialize_deck
  deck = []
  CARD_VALUES.each_key do |card_val|
    SUITS.each do |suit|
      deck << { face: card_val, suit: suit }
    end
  end
  deck.shuffle
end

def deal_card(deck_arr, hand)
  hand << deck_arr.shift
end

def deal_initial_cards(deck_arr, plr_hand, dlr_hand)
  2.times { deal_card(deck_arr, plr_hand) }
  2.times { deal_card(deck_arr, dlr_hand) }
  show_cards_dealt(plr_hand, dlr_hand)
end

def show_cards_dealt(plr_hand, dlr_hand)
  clear_screen
  puts "\n\nDealer has one card down and these cards showing:"
  dlr_hand.each do |card|
    next if card == dlr_hand[0]
    puts card[:face] + " of " + card[:suit] + "\n\n"
  end
  puts "Your cards are:"
  plr_hand.each do |card|
    puts card[:face] + " of " + card[:suit]
  end
end

def valid_input?(str, input_hsh)
  input_hsh.values.flatten.any? { |pattern| pattern.match?(str) }
end

def hit_or_stay(deck_arr, plr_hand, dlr_hand)
  answer = ''
  loop do
    score = calculate_score(plr_hand)
    break if score == TARGET_SCORE || busted?(score)
    loop do
      prompt("\n\nWould you like to hit or stay? h/s")
      answer = gets.chomp.downcase
      break if valid_input?(answer, HIT_OR_STAY)
      prompt("Sorry, that's not a valid option.")
    end
    break if answer == 's' || answer == 'stay'
    deal_card(deck_arr, plr_hand)
    show_cards_dealt(plr_hand, dlr_hand)
  end
end

def calculate_aces(hand, scr)
  hand.each do |card|
    if card[:face] == 'Ace' && scr > TARGET_SCORE
      scr -= 10
    end
  end
  scr
end

def calculate_score(hand)
  score = 0
  hand.each do |card|
    score += CARD_VALUES[card[:face]]
  end
  calculate_aces(hand, score)
end

def busted?(scr)
  scr > TARGET_SCORE
end

def dealer_turn(deck_arr, dlr_hand)
  score = 0
  loop do
    score = calculate_score(dlr_hand)
    break if score >= DEALER_STAYS
    deal_card(deck_arr, dlr_hand)
  end
end

def update_wins(plr_scr, dlr_scr, scr_hsh)
  results = game_results(plr_scr, dlr_scr)
  if results == "\n\nPlayer busts! Dealer wins." ||
     results == "\n\nDealer wins!"
    scr_hsh[:dealer_wins] += 1
  elsif results == "\n\nDealer busts! Player wins." ||
        results == "\n\nPlayer wins!"
    scr_hsh[:player_wins] += 1
  end
end

def reset_wins(scr_hsh)
  scr_hsh.transform_values! { |val| val - val }
end

def game_results(plr_scr, dlr_scr)
  if busted?(plr_scr)
    "\n\nPlayer busts! Dealer wins."
  elsif busted?(dlr_scr)
    "\n\nDealer busts! Player wins."
  elsif plr_scr > dlr_scr
    "\n\nPlayer wins!"
  elsif dlr_scr > plr_scr
    "\n\nDealer wins!"
  else "\n\nPush! No winner."
  end
end

def display_results(plr_scr, dlr_scr, plr_hand, dlr_hand)
  reveal_cards(plr_scr, dlr_scr, plr_hand, dlr_hand)
  puts game_results(plr_scr, dlr_scr)
end

def display_score(win_hsh)
  puts "\n\nPlayer wins: #{win_hsh[:player_wins]}"
  puts "Dealer wins: #{win_hsh[:dealer_wins]}"
end

def someone_won?(win_hsh)
  win_hsh[:player_wins] == WINS_PER_SHUFFLE ||
  win_hsh[:dealer_wins] == WINS_PER_SHUFFLE
end

def reveal_cards(plr_scr, dlr_scr, plr_hand, dlr_hand)
  clear_screen
  puts("\n\nDealer cards:")
  dlr_hand.each do |card|
    puts card[:face] + " of " + card[:suit]
  end
  puts "Dealer score: #{dlr_scr}"
  puts "\n\nPlayer cards:"
  plr_hand.each do |card|
    puts card[:face] + " of " + card[:suit]
  end
  puts "player score: #{plr_scr}"
end

def play_again?
  answer = ''
  loop do
    prompt("Would you like to play again? y/n")
    answer = gets.chomp.downcase
    break if valid_input?(answer, REPLAY)
    prompt("Sorry, that's not a valid option.")
  end
  answer == 'y' || answer == 'yes'
end

clear_screen
loop do
  if display_welcome =~ /\Arules\Z/i
    show_rules
  else break
  end
end
loop do
  wins = { player_wins: 0, dealer_wins: 0 }
  loop do
    player_hand = []
    dealer_hand = []
    clear_screen
    deck = initialize_deck
    deal_initial_cards(deck, player_hand, dealer_hand)
    hit_or_stay(deck, player_hand, dealer_hand)
    player_score = calculate_score(player_hand)
    dealer_turn(deck, dealer_hand) if !busted?(player_score)
    dealer_score = calculate_score(dealer_hand)
    display_results(player_score, dealer_score, player_hand, dealer_hand)
    update_wins(player_score, dealer_score, wins)
    display_score(wins)
    break if someone_won?(wins)
    next if enter_to_continue =~ /./
  end
  reset_wins(wins)
  break unless play_again?
end
prompt("Thank you for playing #{TARGET_SCORE}! Good-bye!")
