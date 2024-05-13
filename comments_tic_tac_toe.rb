# frozen_string_literal: true

require 'tty-spinner'
require 'pry-byebug'
require 'numbers_and_words'

board = Array.new(3) { Array.new(3, '•') }
def new_empty_board
  empty_board = Array.new(3) { Array.new(3, '•') }
  empty_board
end
# board = [
#   ["X", "•", "•"], 
#   ["•", "X", "X"], 
#   ["O", "O", "•"]]

board = [
["X", "O", "•"], 
["O", "X", "X"], 
["O", "X", "O"]]

def print_board(board_state)
  board = board_state
  puts ''
  board.each.with_index do |row, index|
    puts  '   ' + row.map { |item| item == ' ' ? ' • ' : item }.join(' | ')
    puts '  -----------' unless index == 2
  end
  puts ''
end

def winner?(board)
  winning_combos = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 4, 8], [2, 4, 6]             # diagonal
  ]

  winning_combos.each do |combo|
    cell_values = combo.map { |index| board[index / 3][index % 3] }
      if cell_values.all? { |value| value != '•' && value == cell_values[0] }
        return [true, cell_values[0]] # Winning condition met with winning symbol
      end
    end
    false
end

def game_over?(board)
  board.none? { |row| row.include?('•') }
end

def computer_thinking_animation
  spinner = TTY::Spinner.new('[:spinner] Computer is thinking ...', format: :dots_2)
  spinner.auto_spin # Automatic animation with default interval
  sleep(2) # Perform task
  spinner.stop('Done!') # Stop animation
end

def the_game_loop(first_mover, second_mover, board)
  # p winner?(board)
  until winner?(board)
    # p board
    first_mover.move(board, first_mover)
    break if winner?(board) || game_over?(board)

    second_mover.move(board, first_mover)
  end

  if game_over?(board)
    print_board(board)
    puts "No more moves. It's a tie!"
  elsif winner?(board)
    _, winning_symbol = winner?(board)
    if winning_symbol == "X"
      print_board(board)
      puts "Player #{first_mover.player_number.to_words.capitalize} wins the game!"
    else
      puts "Player #{second_mover.player_number.to_words.capitalize} wins the game!"
    end
  end
end

# BoardUpdates is a mixin for all methods related to updating the board.
module BoardUpdates
  attr_accessor :board_state

  def set_board_state(board)
    @board_state = board
  end

  def update_board(board)
    if board.none? { |item| item == '•' }
      puts "Game is over!"
    end
  end
  
  # def print_board(board_state)
  #   board = board_state
  #   puts ''
  #   board.each_slice(3).with_index do |row, index|
  #     puts  '   ' + row.map { |item| item == ' ' ? ' • ' : item }.join(' | ')
  #     puts '  -----------' unless index == 2
  #   end
  #   puts ''
  # end

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
    # # binding.pry
    # p "coin_toss: #{coin_toss}"
    # p "player_one_choice: #{player_one_choice}"
    # p type.class.name
    if coin_toss == player_one_choice
      # # binding.pry
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
    # # binding.pry
  end
  
end

class Boards
  include BoardUpdates
  
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
    'tails'
  end
  
  def determine_second_mover(first_mover, player_one, player_two)
    second_mover = first_mover == player_one ? player_two : player_one
  end
  
  def get_possible_moves(board)
    board_state = board
    all_moves = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]
    possible_moves = []
    board_state.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        possible_moves << [row_index, col_index] if cell == '•'
      end
    end
    taken_moves = all_moves - possible_moves
    temp_board = new_empty_board
    # Replace the taken moves with their corresponding symbols ('X' or 'O')
    taken_moves.each { |move| temp_board[move[0]][move[1]] = move[0].even? ? 'X' : 'O' }
    # binding.pry

    # Map the board to get the current status of all moves
    possible_moves = all_moves.map do |move|
      if taken_moves.include?(move)
        [board[move[0]][move[1]], board[move[0]][move[1]]]
      else
        move
      end
    end
    # puts possible_moves.inspect
    possible_moves
    # binding.pry
  end
  
def print_possible_moves(possible_moves)
    # Partition the possible moves into cells with integers and cells with letters
    integer_cells, letter_cells = possible_moves.partition { |move| move.all? { |item| item.is_a?(Integer) } }
    puts ''
    3.times do |row|
      3.times do |col|
        index = row * 3 + col + 1
        cell_value = nil
  
        # Check if the current cell is in the letter_cells array
        possible_moves.each do |move|
          letter_cells.each do |letter_cell|
            if move == letter_cell
              cell_value = possible_moves[index - 1][0] # Assign the first letter of the letter_cell array as cell_value
            end
          end
        end
        
        # Check if the current cell is in the integer_cells array
        if integer_cells.include?([row, col])
          cell_value = index
        end
  
        # Print the cell_value with formatting
        if col == 2
          print "#{cell_value}"
        else
          print "#{cell_value}|"
        end
      end
      puts '' # Move to the next row
    end
    puts ''
  end
  
  def possible_moves_index(possible_moves)
    moves_index = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil, 8 => nil, 9 => nil }
    possible_moves.each_with_index do |move, index|
      moves_index[index + 1] = move
    end
  moves_index
  end
  
  def choice_already_taken?(user_choice, possible_moves_index)
    move = possible_moves_index[user_choice]
    return move.include?("X") || move.include?("O") if move.is_a?(Array)
    false
  end
  
end

# Human defines the parameters for a human player
class Human < Players
  def initialize(number)
    super(number)
    @player_number = number
  end

  def move(board, first_mover)
    board_state = board.dup
    print_board(board)
    possible_moves = get_possible_moves(board_state)
    puts "Alright Player #{player_number.to_words.capitalize}, you're up…"
    print_possible_moves(possible_moves)
    puts "(X) Pick your move…" if first_mover == self
    puts "(O) Pick your move…" if first_mover != self
    # binding.pry
    player_choice = nil
    moves_index = possible_moves_index(possible_moves)
    # unless possible_moves.include?(player_choice) && player_choice
    until player_choice.is_a?(Integer) && moves_index.key?(player_choice)
      choice = gets.chomp
      choice_int = choice.to_i
      if not moves_index.key?(choice_int)
        puts "Outside the bounds of this board. Please pick another."
      elsif choice_already_taken?(choice_int, moves_index)
        puts "That space is taken. Please pick another: 1-9"
        player_choice = "taken"
      else
        player_choice = choice_int
      end
    end
    row_index, col_index = moves_index[player_choice]
    if first_mover == self
      board[row_index][col_index] = 'X'
    else
      board[row_index][col_index] = 'O'
    end
    
    # board_state[row_index][col_index] = 'O'
    print_board(board)
  end
end

# Computer is the computer as Player Two
class Computer < Players
  def initialize(number)
    super(number)
    @player_number = number
  end

  def move(board, first_mover)
    # puts "board state 01: "
    # p board
    board_state = board.dup
    possible_moves = get_possible_moves(board_state)
    valid_moves = possible_moves.reject { |move| move.any? { |item| item.is_a?(String) } }
    # puts "possible_moves: #{possible_moves}"
    puts "Alright Computer, you're up…"
    computer_thinking_animation
    computer_choice = valid_moves.sample
    # puts "computer_choice: #{computer_choice}"
    row_index, col_index = computer_choice
    if first_mover == self
      board[row_index][col_index] = 'X'
    else
      board[row_index][col_index] = 'O'
    end
    # p board
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

if winner?(board)
  puts "we have a winner"
end
player_one = Human.new(1)
# p player_one
puts ''
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
# puts "first_mover: #{first_mover}"
second_mover = player_one.determine_second_mover(first_mover, player_one, player_two)
# puts "first_mover: #{first_mover}"
# puts "second_mover: #{second_mover.player_number.to_words.capitalize}"
# second_mover = 
# binding.pry
print_board(board)
# this sets the board state for the following variables.
# board01.board_with_numbers(get_board_state)
# game_one_view.computer_thinking_animation if first_mover.instance_of?(::Computer)
# # binding.pry
the_game_loop(first_mover, second_mover, board)

  # blank_board = <<-BOARD
# 
#    |   |   
# -----------
#    |   |   
# -----------
#    |   |   
# 
# BOARD


  # def print_possible_moves(possible_moves)
#   puts ''
#   3.times do |row|
#     p row
#     3.times do |col|
#       p col
#       index = row * 3 + col + 1
#       cell_value = possible_moves.find { |move| move.is_a?(Array) && move == [row, col] }
#       cell_value = cell_value.nil? ? index : (cell_value.include?('X') || cell_value.include?('O')) ? cell_value[0] : index
#       if col == 2
#         print "#{cell_value}"
#       else
#         print "#{cell_value}" + '|'
#       end
#     end
#     puts ''
#   end
#   puts ''
# end


# def print_possible_moves(possible_moves)
#   p possible_moves
#   possible_moves.each_slice(3).with_index do |item, index|
#     move_number = index + 1
#     print " #{move_number} |" if item != 'X' || item != 'O'
#   end
#   puts ''
# end