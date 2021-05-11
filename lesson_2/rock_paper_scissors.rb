VALID_CHOICES = { 'r': 'rock',
                  'p': 'paper',
                  'sc': 'scissors',
                  'l': 'lizard',
                  'sp': 'Spock' }

WINNING_MOVES = { 'rock': ['scissors', 'lizard'],
                  'paper': ['rock', 'Spock'],
                  'scissors': ['paper', 'lizard'],
                  'lizard': ['paper', 'Spock'],
                  'Spock': ['rock', 'scissors'] }

def prompt(message)
  puts "=>#{message}"
end

def win?(first, second)
  WINNING_MOVES.values_at(first.to_sym).flatten.include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

player_score = 0
computer_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one:
            r = rock,
            p = paper,
            sc = scissors,
            l = lizard,
            sp = Spock")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice.to_sym)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample
  player_choice = VALID_CHOICES[choice.to_sym]
  prompt("You chose: #{player_choice}. Computer chose: #{computer_choice}.")

  display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_score += 1
  end
  if win?(computer_choice, player_choice)
    computer_score += 1
  end

  puts "Player score: #{player_score}"
  puts "Computer score: #{computer_score}"

  if player_score == 5
    puts "You won 5 games! You are the Grand Champion!"
    player_score = 0
    computer_score = 0
  end
  if computer_score == 5
    puts "The computer won 5 games! The computer is the Grand Champion!"
    player_score = 0
    computer_score = 0
  end

  prompt("Would you like to play again? y/n")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thank you for playing. Good bye!")
