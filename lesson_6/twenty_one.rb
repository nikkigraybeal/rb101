CARD_VALUES = { 'Ace' => 11, 'Two' => 2, 'Three' => 3, 'Four' => 4,
                'Five' => 5, 'Six' => 6, 'Seven' => 7, 'Eight' => 8,
                'Nine' => 9, 'Ten' => 10, 'Jack' => 10, 'Queen' => 10,
                'King' => 10 }

SUITS = ['of Hearts', 'of Diamonds', 'of Spades', 'of Clubs']

TARGET_SCORE = 21

DEALER_STAYS = 17

WINS_PER_SHUFFLE = 5

WINS = { player_wins: 0, dealer_wins: 0 }

REPLAY = { 'yes' => [/\Ay\Z/i, /\Ayes\Z/i],
           'no' => [/\An\Z/i, /\Ano\Z/i] }

HIT_OR_STAY = { 'hit' => [/\Ah\Z/i, /\Ahit\Z/i],
                'stay' => [/\As\Z/i, /\Astay\Z/i] }

PLAYER_HAND = []

DEALER_HAND = []

def clear_screen
  system 'clear'
end

def prompt(msg)
  puts "=>#{msg}"
end

# rubocop:disable Metrics/MethodLength
def show_rules
  prompt("Players are each dealt two cards. While the dealer
  is also dealt two cards only one is exposed and the other
  is hidden. The value of cards two through ten is their pip
  value (2 through 10). Face cards (Jack, Queen, and King) are
  all worth ten. Aces can be worth one or eleven. A hand's value
  is the sum of the card values. The better hand is the hand
  where the sum of the card values is closer to #{TARGET_SCORE} without
  exceeding #{TARGET_SCORE}. Players are allowed to 'hit' (draw additional
  cards) to improve their hands.

  After the players have drawn enough cards that they are either
  satisfied with their card total or have exceeded #{TARGET_SCORE}, it is
  the dealer's turn. The dealer must draw cards until the cards total up to
  #{DEALER_STAYS} points. At #{DEALER_STAYS} points or higherthe dealer
  must stop.

  If the player exceeds a sum of #{TARGET_SCORE} ('busts'), the player loses.
  If the dealer exceeds #{TARGET_SCORE} ('busts') and the player does not,
  the player wins.
  If the player attains a final sum higher than the dealer and
  does not bust, the player wins.
  If both dealer and player receive a #{TARGET_SCORE} or any other hands
  with the same sum, this will be called a 'push' and no one wins.\n\n")
end
# rubocop:enable Metrics/MethodLength

def initialize_deck
  deck = []
  CARD_VALUES.each_key do |card_val|
    SUITS.each do |suit|
      deck << card_val + ' ' + suit
    end
  end
  deck.shuffle
end

def deal_card(deck_arr, hand)
  hand << deck_arr.shift
end

def show_cards_dealt
  clear_screen
  puts "\n\nDealer has one card down and these cards showing:"
  DEALER_HAND.each do |card|
    next if card == DEALER_HAND[0]
    puts card.to_s + "\n\n"
  end
  puts "Your cards are:"
  PLAYER_HAND.each do |card|
    puts card.to_s
  end
end

def valid_input?(str, input_hsh)
  input_hsh.values.flatten.any? { |pattern| pattern.match?(str) }
end

def hit_or_stay(deck_arr)
  answer = ''
  loop do
    score = calculate_score(PLAYER_HAND)
    break if score == TARGET_SCORE || busted?(score)
    loop do
      prompt("\n\nWould you like to hit or stay? h/s")
      answer = gets.chomp.downcase
      break if valid_input?(answer, HIT_OR_STAY)
      prompt("Sorry, that's not a valid option.")
    end
    break if answer == 's' || answer == 'stay'
    deal_card(deck_arr, PLAYER_HAND)
    show_cards_dealt
  end
end

def calculate_aces(hand, scr)
  hand.each do |card|
    card = card.split(' ')[0]
    if card == 'Ace' && scr > TARGET_SCORE
      scr -= 10
    end
  end
  scr
end

def calculate_score(hand)
  score = 0
  hand.each do |card|
    card = card.split(' ')[0]
    score += CARD_VALUES[card]
  end
  calculate_aces(hand, score)
end

def busted?(scr)
  scr > TARGET_SCORE
end

def dealer_turn(deck_arr)
  score = 0
  loop do
    score = calculate_score(DEALER_HAND)
    break if score >= DEALER_STAYS
    deal_card(deck_arr, DEALER_HAND)
  end
end

def update_wins(plr_scr, dlr_scr)
  results = game_results(plr_scr, dlr_scr)
  if results == "\n\nPlayer busts! Dealer wins." ||
     results == "\n\nDealer wins!"
    WINS[:dealer_wins] += 1
  elsif results == "\n\nDealer busts! Player wins." ||
        results == "\n\nPlayer wins!"
    WINS[:player_wins] += 1
  end
end

def reset_wins
  WINS.transform_values! { |val| val - val }
end

def game_results(plr_scr, dlr_scr)
  if busted?(plr_scr)
    results = "\n\nPlayer busts! Dealer wins."
  elsif busted?(dlr_scr)
    results = "\n\nDealer busts! Player wins."
  elsif plr_scr > dlr_scr
    results = "\n\nPlayer wins!"
  elsif dlr_scr > plr_scr
    results = "\n\nDealer wins!"
  else results = "\n\nPush! No winner."
  end
  results
end

def display_results(plr_scr, dlr_scr)
  reveal_cards(plr_scr, dlr_scr)
  puts game_results(plr_scr, dlr_scr)
end

def reveal_cards(plr_scr, dlr_scr)
  clear_screen
  puts("\n\nDealer cards:")
  DEALER_HAND.each do |card|
    puts card.to_s
  end
  puts "Dealer score: #{dlr_scr}"
  puts "\n\nPlayer cards:"
  PLAYER_HAND.each do |card|
    puts card.to_s
  end
  puts "player score: #{plr_scr}"
end

clear_screen
loop do
  prompt("Welcome to #{TARGET_SCORE}! If you know how to play,
  press any key to begin, otherwise enter 'rules'
  to learn how to play.")
  answer = gets.chomp
  if answer == 'rules'
    show_rules
  else break
  end
end
loop do
  loop do
    PLAYER_HAND.clear
    DEALER_HAND.clear
    clear_screen
    deck = initialize_deck
    2.times { deal_card(deck, PLAYER_HAND) }
    2.times { deal_card(deck, DEALER_HAND) }
    show_cards_dealt
    hit_or_stay(deck)
    player_score = calculate_score(PLAYER_HAND)
    dealer_turn(deck) if !busted?(player_score)
    dealer_score = calculate_score(DEALER_HAND)
    display_results(player_score, dealer_score)
    update_wins(player_score, dealer_score)
    puts "\n\nPlayer wins: #{WINS[:player_wins]}"
    puts "Dealer wins: #{WINS[:dealer_wins]}"
    break if WINS[:player_wins] == WINS_PER_SHUFFLE ||
             WINS[:dealer_wins] == WINS_PER_SHUFFLE
    puts "\n\nPress any key to continue."
    answer = gets.chomp
    next if answer =~ /./
  end
  reset_wins
  answer = ''
  loop do
    prompt("Would you like to play again? y/n")
    answer = gets.chomp.downcase
    break if valid_input?(answer, REPLAY)
    prompt("Sorry, that's not a valid option.")
  end
  break if answer == 'n' || answer == 'no'
end
prompt("Thank you for playing Twenty-One! Good-bye!")
