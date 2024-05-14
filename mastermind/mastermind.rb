# frozen_string_literal: true

require 'pry-byebug'
require 'tty-spinner'
require "tty-cursor"
cursor = TTY::Cursor
require_relative 'mm_view' # view

module GamePieces
  attr_reader :code_pegs, :key_pegs, :char_to_index, :secret_code
  
  def initialize
    @@code_pegs = [ '🔴', '🟡 ', '🔵', '🟢 ', '🟣 ', '🟠 ' ]
    @@key_pegs = [ '⚫', '⚪' ]
    @hole = '⬜️'
    @@char_to_index = {
      'r' => 0,
      'y' => 1,
      'b' => 2,
      'g' => 3,
      'p' => 4,
      'o' => 5
    }
    @@secret_code  = generate_new_code
  end
  
  def generate_new_code
    code_pegs = GamePieces.code_pegs.dup
    new_code = []
    until new_code.size == 4
      random_peg = code_pegs.sample
      code_pegs.delete(random_peg)
      new_code << random_peg
    end
    if weighted_sample(18)
      double_peg = random_peg
      old_peg = new_code.index(new_code.sample)
      new_code[old_peg] = random_peg
    end
    new_code
  end
  
  def weighted_sample(percent)
    percent >= rand(1..100)
  end
  
  def self.code_pegs
    @@code_pegs
  end
  
  def self.char_to_index
    @@char_to_index
  end
end

class GameModel # model
  include GamePieces
end

class Player # model
  def initialize
    @name = 'human'
    @score = 0
  end
end

class Computer # model
  include GamePieces
  
  def initialize
    @name = 'computer'
    @score = 0
  end
end

# controller
class GameController
  attr_reader :rounds, :turns, :turn, :guesses, :maker_points, :breaker_points, :feedback # may not need all these. xxx
  attr_writer :maker_points, :breaker_points

  def initialize(game_board, display)
    @game_board = game_board
    @display = display
    @rounds = [3, 2, 1]
    @turns = (1..10).to_a.reverse
    @guesses = []
    @feedback = []
    @maker_points = []
    @breaker_points = []
  end
  
  def next_turn
    @turns.pop
  end

  def next_round
    if @rounds.size > 0
      @rounds.pop
    else
      @rounds
    end
    @guesses = []
    @turns = (1..10).to_a.reverse
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
    until valid_input?(guess) && guess.length == 4
      @display.invalid_turn_input
      guess = gets.chomp.downcase
    end
    if guess == "exit"
      puts `clear`
      exit
    end
    guess
  end
  
  def valid_input?(guess)
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
    @display.print_board(@turns, @turns[-1], @guesses, @feedback, secret_code)
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

class GameLoop
  include GamePieces
  
  attr_reader :display, :controller, :game_board

  def initialize
    @game_board = GameModel.new
    @display = GameView.new(@game_board.code_pegs, @game_board.key_pegs)
    @controller = GameController.new(@game_board, @display)
  end
  
  def start_game(game)
    computer = Computer.new
    secret_code = computer.generate_new_code
    controller = game.controller
    game.display.print_board(controller.turns, controller.turns[-1], controller.guesses, controller.feedback, secret_code)
    # game.display.print_board
    game.display.prompt_for_turn
    print game.display.cursor.move(72, 1)
    return secret_code
  end
  
  def the_round_loop(game)
    secret_code = start_game(game)
    guess = game.controller.guesses[-1]
    until game.controller.round_over?(guess, secret_code, game.controller.turns[-1], game.controller.turns)
      game.controller.process_codebreaker_input(secret_code)
      guess = game.controller.guesses[-1]
      unless guess == secret_code || game.controller.turns == []
        game.display.prompt_for_turn
        print game.display.cursor.move(72, 1)
      end
    end
  end
  
  def broken_first_turn?(game)
    return true if game.controller.turns[-1] == 2
  end
  
  def code_not_broken?(game)
    return true if game.controller.turns == []
  end
  
  def calcuate_points(game)
    controller = game.controller
    round_end_options = ['broken', 'not_broken']
    if broken_first_turn?(game)
      controller.maker_points << 1
      controller.breaker_points << 9
      round_end_options[0]
    elsif code_not_broken?(game)
      controller.maker_points << 11
      controller.breaker_points << 0
      round_end_options[1]
    else
      controller.maker_points << 10 - controller.turns.size
      controller.breaker_points << controller.turns.size
      round_end_options[0]
    end
  end
  
  def after_round(game)
    print_game_over(game) if game.controller.rounds == []
    finished_round = game.controller.next_round
    @display.print_round_over(game, calcuate_points(game))
    @display.print_game_state(game, finished_round)
    # puts game.controller.rounds
    # print_variables(game, finished_round)
  end
  
  def self.new_game
    computer = Computer.new
    game.display.new_blank_board
    computer.generate_new_code
    game.display.prompt_for_turn
    print game.display.cursor.move(72, 1)
  end
  
  def print_variables(game, finished_round)
    puts "@turn: #{game.controller.turns[-1]}"
    puts "@turns: #{game.controller.turns}"
    puts "game.guess: #{game.controller.guesses[-1]}"
    p finished_round
    puts "game.controller.maker_points: #{game.controller.maker_points}"
  end
end

game = GameLoop.new
game.the_round_loop(game)
game.after_round(game)
game.display.print_next_round_prompt(game)
game.the_round_loop(game)