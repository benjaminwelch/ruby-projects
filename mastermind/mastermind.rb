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
  attr_reader :rounds, :turns, :turn, :guesses # may not need all these. xxx

  def initialize(game_board, display)
    @game_board = game_board
    @display = display
    @rounds = 3
    @turns = 10
    @turn = 1
    @guesses = []
    @feedback = []
  end
  
  def next_turn
    @turn += 1
  end

  def next_round
    @rounds -= 1 if @rounds > 0
  end
  
  def round_over?(guess = game.controller.guesses[-1], secret_code, turn, turns)
    round_conditions = [
      guess == secret_code,
      turn > turns
    ]
    # return true if round_conditions.any? { |condition| condition }
    if round_conditions.any? { |condition| condition }
      # puts true
      # puts "guess: #{guess}"
      # puts "secret_code: #{secret_code}"
      # puts "turn: #{turn}"
      # puts "turns: #{turns}"
      return true
    end
    # puts false
    # puts "guess: #{guess}"
    # puts "secret_code: #{secret_code}"
    # puts "turn: #{turn}"
    # puts "turns: #{turns}"
    false
  end
  
  def process_codebreaker_input(secret_code)
    # p "secret_code: #{secret_code}"
    guess = gets.chomp.downcase
    until valid_input?(guess) && guess.length == 4
      @display.invalid_turn_input
      guess = gets.chomp.downcase
    end
    map_input_to_guess(guess, secret_code)
  end
  
  def valid_input?(guess)
    required_characters = ['r', 'y', 'b', 'g', 'p', 'o']
    guess_array = guess.chars.to_a
    guess_array.all? { |char| required_characters.include?(char) }
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
    @display.print_board(@turns, @turn, @guesses, @feedback, secret_code)
  end
  
  def check_guesses(guess, secret_code)
    if round_over?(guess, secret_code, turn, turns)
      @display.print_round_over
      guess_feedback = ['■', '■', '■', '■']
      self.next_round
      
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
    game.display.new_blank_board(secret_code)
    # game.display.print_board
    game.display.prompt_for_turn
    print game.display.cursor.move(72, 1)
    return secret_code
  end
  
  def the_round_loop(game)
    secret_code = start_game(game)
    guess = game.controller.guesses[-1]
    until game.controller.round_over?(guess, secret_code, game.controller.turn, game.controller.turns)
      game.controller.process_codebreaker_input(secret_code)
      game.display.prompt_for_turn
      # print game.display.cursor.move(72, 1)
    end
  end
  
  def self.new_game
    computer = Computer.new
    game.display.new_blank_board
    computer.generate_new_code
    game.display.prompt_for_turn
    print game.display.cursor.move(72, 1)
  end
  
  def print_variables(game)
    puts "@turn: #{game.controller.turn}"
    puts "@turns: #{game.controller.turns}"  
  end
end

game = GameLoop.new
game.the_round_loop(game)




# computer = Computer.new
# # secret_code = ["🔴", "🔵", "🟣 ", "🟢 "]
# secret_code = computer.generate_new_code
# p "game.controller.turns: #{game.controller.turns}"
# p "game.controller.turn: #{game.controller.turn}"
# p "game.controller.guesses.size: #{game.controller.guesses.size}"
# # game.display.print_board(game.controller.turns, game.controller.turn, game.controller.guesses)
# game.display.prompt_for_turn
# print game.display.cursor.move(72, 1)
# game.controller.process_codebreaker_input(secret_code)
# game.controller.process_codebreaker_input(secret_code)
# game.controller.process_codebreaker_input(secret_code)
# p "game.controller.turns: #{game.controller.turns}"
# p "game.controller.turn: #{game.controller.turn}"
# p "game.controller.rounds: #{game.controller.rounds}"
# p "game.controller.guesses.size: #{game.controller.guesses.size}"
# p secret_code
# game = GameLoop.new
# computer = Computer.new
# game.display.new_blank_board
# computer.generate_new_code
# game.display.prompt_for_turn
# print game.display.cursor.move(72, 1)
# guess = game.controller.process_codebreaker_input