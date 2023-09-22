SUITS = ['hearts', 'diamonds', 'spades', 'clubs']
VALUES = ['2','3','4','5','6','7','8','9','jack', 'queen', 'king', 'ace']
POINTS = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}

def prompt(msg)
  puts " => #{msg}"
end

def build_deck(suits, values)
  deck = []

  suits.each do |suit|
    all_cards_of_a_suit = []

    values.each do |value|
      all_cards_of_a_suit << [value, suit]
    end
  
    deck << all_cards_of_a_suit
  end

  deck.flatten(1).shuffle!
end

def hand_value(hand)
  total = 0
  counter = 0

  hand.each do |card|
    total += POINTS[hand[counter][0]]
    counter += 1

    if card.include?("ace") && total > 21
      total -= 10
    end
  end

  total
end

def busted?(hand)
  hand_value(hand) > 21
end

def winner(player_hand, dealer_hand)
  if hand_value(player_hand) > hand_value(dealer_hand)
    "You win!"
  elsif hand_value(dealer_hand) > hand_value(player_hand)
    "Dealer wins!"
  else
    "It's a tie!"
  end
end

loop do # main game loop
  deck = build_deck(SUITS, VALUES)

  dealer_hand = [deck.shift, deck.shift]
  player_hand = [deck.shift, deck.shift]

  prompt "Dealer has: #{dealer_hand[0].join(' of ')} and an unknown card."
  prompt "Player has: #{player_hand[0].join(' of ')} and #{player_hand[1].join(' of ')}."

  loop do
    prompt "Player turn: hit or stay?"
    answer = gets.chomp
    break if answer.downcase == 'stay'

    player_hand << deck.shift
    prompt "You were dealt the #{player_hand.last.join(' of ')}."
    break if busted?(player_hand)
  end

  if busted?(player_hand)
    prompt "You busted. You lose!"
    prompt "Play again? (yes/no)"
    answer = gets.chomp
    next if answer == 'yes' 
    break
  else
    prompt "You chose to stay. Your total is #{hand_value(player_hand)}. Dealer's turn."
  end

  loop do
    if hand_value(dealer_hand) > 17
      prompt "Dealer total is #{hand_value(dealer_hand)}." 
      break
    end

    prompt "The dealer hits."
    dealer_hand << deck.shift
    prompt "The dealer was dealt the #{dealer_hand.last.join(' of ')}."

  end

  if busted?(dealer_hand)
    prompt "The dealer busted. You win!" 
  else
    prompt "The dealer stays."
    prompt "#{winner(player_hand, dealer_hand)}"
  end

  prompt "Play again? (yes/no)"
  answer = gets.chomp
  break unless answer == 'yes' 
end
