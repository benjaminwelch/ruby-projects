# frozen_string_literal: true

require 'tty-spinner'
require 'pry-byebug'

# BoardUpdates is a mixin for all methods related to updating the board.
module BoardUpdates
  attr_accessor :board_state

  def initialize_board_state
    @board_state = Array.new(9, '•')
  end

  def get_board_state
    return nil unless @board_state
    board_state = @board_state.dup
    if board_state.all? { |item| item == 'X' || item == "O" }
      puts "It's a tie!"
    end
    @board_state
  end

  def set_board_state(board)
    @board_state = board
  end

  def update_board(board)
    if board.none? { |item| item == '•' }
      puts "Game is over!"
    end
  end
  
  def print_board(board_state)
    board = board_state
    puts ''
    board.each_slice(3).with_index do |row, index|
      puts  '   ' + row.map { |item| item == ' ' ? ' • ' : item }.join(' | ')
      puts '  -----------' unless index == 2
    end
    puts ''
  end

  def print_board_numbers(board_state)
    board = board_state
    # puts ''
    board.each_slice(3).with_index do |row, index|
      puts '   ' + row.each_with_index.map { |item, col_index| "#{index * 3 + col_index}"}.join(' | ')
      puts '  -----------' unless index == 2
    end
    puts ''
  end
end

# GameBoard will create and update the board as moves are made and games are finished.
class Games
  attr_reader :type, :score

  @score = 0

  def initialize(game_type)
    @type = game_type
    @number_of_games = 3
    puts "Alright, it's human vs. #{game_type.class.name.downcase}!"
  end
end

# class GameView contains all the strings and visuals.
class GameView
  def initialize(game)
    @game = game
    @type = game.type
    @score = game.score
  end

  def start_of_game
    puts <<~OPENING_MESSAGE
      ---
      Let's play Tic Tac Toe.
      Would you like to play a human or the computer?
      Type 'h' for human and 'c' for computer…
      ---
    OPENING_MESSAGE
  end

  def choose_game_type
    get_game_type = gets.chomp.downcase
    until %w[h c].include?(get_game_type)
      puts "Invalid input. Type 'h' for human and 'c' for computer…"
      get_game_type = gets.chomp.downcase
    end
    if get_game_type == 'h'
      'human'
    else
      'computer'
    end
  end

  def new_game_message(player_one, player_two, type)
    puts <<~INITIAL_SCORES
      Player One (human) Score = #{player_one.score}
      Player Two (#{type.class.name.downcase}) Score = #{player_two.score}
    
    INITIAL_SCORES
    puts 'Flipping a coin to see who goes first…'
    puts 'heads(h) or tails(t)?'
    heads_or_tails = gets.chomp.downcase
    until %w[h t].include?(heads_or_tails)
      puts "Invalid input. Type 'h' for heads and 't' for tails…"
      heads_or_tails = gets.chomp.downcase
    end
    if heads_or_tails == 'h'
      'heads'
    else
      'tails'
    end
  end

  def who_goes_first(player_one, player_two, type)
    player_one_choice = new_game_message(player_one, player_two, type)
    # p player_one_choice
    coin_toss = player_one.coin_flip
    # binding.pry
    p "coin_toss: #{coin_toss}"
    p "player_one_choice: #{player_one_choice}"
    # p type.class.name
    if coin_toss == player_one_choice
      # binding.pry
      first_mover = player_one
      puts "It's #{player_one_choice}. Place your first X, Player One…"
    else
      first_mover = player_two
      if type.instance_of?(::Computer)
        puts "It's #{coin_toss}. The computer gets the first move!"
      elsif type.instance_of?(::Human)
        puts "It's #{coin_toss}. Place your first X, Player Two"
      end
    end
    first_mover
    # binding.pry
  end
  
  def computer_thinking_animation
    spinner = TTY::Spinner.new('[:spinner] Computer is thinking ...', format: :dots_2)
    spinner.auto_spin # Automatic animation with default interval
    sleep(2) # Perform task
    spinner.stop('Done!') # Stop animation
  end
  
end

class Boards
  include BoardUpdates

  def new_game_board
    # here is the board
    # board_grid = Array.new(3) { Array.new(3, '  ') }
    board = initialize_board_state
    puts ''
    board.each_slice(3).with_index do |row, index|
      puts  '   ' + row.map { |item| item == ' ' ? ' • ' : item }.join(' | ')
      puts '  -----------' unless index == 2
    end
    puts ''
    # puts "set_board_state: #{set_board_state(board)}"
    board
  end
  
  def board_with_numbers(current_board)
    current_board_state = current_board.map.with_index { |item, index| item == '•' ? index.to_s : item }
    # puts ''
    current_board_state.each_slice(3).with_index do |row, index|
      puts '   ' + row.each_with_index.map { |item, col_index| "#{index * 3 + col_index}"}.join(' | ')
      puts '  -----------' unless index == 2
    end
    puts ''
    current_board_state
  end
end

# Players -> Computer/Human creates and tracks players, scores, etc.
class Players
  include BoardUpdates
  attr_reader :score, :player_number

  def initialize(number)
    @score = 0
    @player_number = number
  end

  def coin_flip
    rand(1..2) == 1 ? 'heads' : 'tails'
  end
end

# Human defines the parameters for a human player
class Human < Players
  def initialize(number)
    super(number)
    @player_number = number
  end

  def move(current_board)
    current_board_state = get_board_state
    p current_board_state
    possible_moves = current_board_state.reject { |item| item == "X" || item == "O"}
    p possible_moves
    computer_choice = rand(0...possible_moves.size)
    p computer_choice
    possible_moves[computer_choice] = 'X'
    move_made = possible_moves
    set_board_state(move_made)
  end
end

# Computer is the computer as Player Two
class Computer < Players
  def initialize(number)
    super(number)
    @player_number = number
  end

  def move(current_board)
    # current_board_state = current_board.board_with_numbers(current_board.board_state)
    current_board_state = get_board_state
    p current_board_state
    possible_moves = current_board_state.reject { |item| item == "X" || item == "O"}
    p possible_moves
    computer_choice = rand(0...possible_moves.size)
    p computer_choice
    possible_moves[computer_choice] = 'X'
    move_made = possible_moves
    set_board_state(move_made)
  end
end

def choose_game_type
  get_game_type = gets.chomp.downcase
  until %w[h c].include?(get_game_type)
    puts "Invalid input. Type 'h' for human and 'c' for computer…"
    get_game_type = gets.chomp.downcase
  end
  if get_game_type == 'h'
    player_two = Human.new(2)
  else
    player_two = Computer.new(2)
  end
  player_two
end

player_one = Human.new(1)
# p player_one
puts <<-OPENING_MESSAGE
  Let's play Tic Tac Toe.
  Would you like to play a human or the computer?
  Type 'h' for human and 'c' for computer…
OPENING_MESSAGE
game_type = choose_game_type
player_two = game_type
# p player_two
game_one = Games.new(game_type)
game_one_view = GameView.new(game_one)
# puts game_one
game_one_view.start_of_game
# new_game_message is called by who_goes_first
first_mover = game_one_view.who_goes_first(player_one, player_two, game_type)
board01 = Boards.new
# this sets the board state for the following variables.
game_board01 = board01.new_game_board
# board01.board_with_numbers(get_board_state)
puts "board_state 1: #{game_board01}"
game_one_view.computer_thinking_animation if first_mover.instance_of?(::Computer)
# binding.pry
first_mover.move(board01)
state_board01 = board01.get_board_state
p state_board01
puts "state_board01: #{state_board01}"
puts player_one.get_board_state
p player_one
p player_two




  # blank_board = <<-BOARD
# 
#    |   |   
# -----------
#    |   |   
# -----------
#    |   |   
# 
# BOARD