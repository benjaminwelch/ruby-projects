# controller
class GameController
  attr_reader :turn # may not need all these. xxx
  attr_accessor :rounds, :maker_points, :breaker_points, :this_round_over, :guesses, :turns, :feedback

  def initialize(game_board, display)
    @game_board = game_board
    @display = display
    @rounds = [3, 2, 1]
    @turns = (1..10).to_a.reverse
    @guesses = []
    @feedback = []
    @maker_points = []
    @breaker_points = []
    @this_round_over = false
  end
  
  def next_turn
    @turns.pop
  end

  def next_round(game)
    c = game.controller
    c.guesses = []
    c.turns = (1..10).to_a.reverse
    c.feedback = []
    c.this_round_over = false
    if c.rounds.size > 0
      c.rounds.pop
    else
      c.rounds
    end
  end
  
  def round_over?(guess, secret_code, turn, turns)
    round_conditions = [
      guess == secret_code,
      turns == []
    ]
    # return true if round_conditions.any? { |condition| condition }
    if round_conditions.any? { |condition| condition }
      return true
    end
    false
  end
  
  def process_codebreaker_input(secret_code)
    # p "secret_code: #{secret_code}"
    guess = get_valid_guess
    guess_colors = map_input_to_guess(guess, secret_code)
    guess = guess_colors
  end
  
  def get_valid_guess
    guess = gets.chomp.downcase
    until valid_guess_input?(guess) && guess.length == 4
      @display.invalid_turn_input
      guess = gets.chomp.downcase
    end
    if guess == "exit"
      puts `clear`
      exit
    end
    guess
  end
  
  def valid_guess_input?(guess)
    required_characters = ['r', 'y', 'b', 'g', 'p', 'o']
    guess_array = guess.chars.to_a
    guess_array.all? { |char| required_characters.include?(char) } || guess == "exit"
  end
  
  def map_input_to_guess(guess, secret_code)
    pegs = GamePieces.code_pegs.dup
    index = GamePieces.char_to_index.dup
    c_to_a = guess.split("")
    guess_colors = []
    c_to_a.each do |char|
      color_index = index[char]
      color = pegs[color_index]
      guess_colors << color
    end
    @guesses << guess_colors
    @feedback << guess_feedback = check_guesses(guess_colors, secret_code)
    self.next_turn
  end
  
  def check_guesses(guess, secret_code)
    if round_over?(guess, secret_code, turn, turns)
      guess_feedback = ['■', '■', '■', '■']
    else
      guess_feedback = calculate_guess_feedback(guess, secret_code)
    end
    guess_feedback
  end
  
  def calculate_guess_feedback(guess, secret_code)
    # p "guess: #{guess}"
    # p "secret_code: #{secret_code}"
    guess_feedback = []
    guess_array = guess.dup
    secret = secret_code.dup
    until guess_feedback.size == 4
      guess_array.reverse_each.with_index do |color, index|
        if guess_feedback.size >= 4
          break
        elsif guess_array[-(index + 1)] == secret[-(index + 1)]
          guess_feedback << '■'
          guess_array[-(index + 1)] = '🚫'
          secret[-(index + 1)] = '🚫'
        end
      end
      guess_array = guess_array.reject { |element| element == "🚫" }
      secret = secret.reject { |element| element == "🚫" }
      # binding.pry
      guess_array.each_with_index do |color, index|
        if guess_feedback.size >= 4
          break
        elsif secret.include?(color)
          # binding.pry
          guess_feedback << '□'
         else
          guess_feedback << '•'
        end
      end
    end
    guess_feedback = guess_feedback.shuffle
  end
    
  def self.rounds
    @rounds
  end
  
  def self.turns
    @turns
  end
  
  def self.turn
    @turn
  end
end