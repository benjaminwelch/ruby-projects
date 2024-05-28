require_relative 'mm_game_pieces.rb'

class GameModel
  include GamePieces
end

class GameLoop
  include GamePieces
  
  attr_reader :display, :controller, :game_board

  def initialize
    @game_board = GameModel.new
    @display = GameView.new(@game_board.code_pegs, @game_board.key_pegs)
    @controller = GameController.new(@game_board, @display)
  end
  
  def start_game_prompt(game)
    input = gets.chomp.downcase
    valid_options = ['exit', 'help', 'play']
  
    until valid_options.include?(input)
      @display.invalid_input
      input = gets.chomp.downcase
    end
  
    case input
    when 'exit'
      puts `clear`
      exit
    when 'help'
      game.display.print_instructions
      print game.display.cursor.forward(4)
      game.start_game_prompt(game)
    when 'play'
      input
    end
  end
  
  def start_game(game, secret_code)
    computer = Computer.new
    controller = game.controller
    game.display.print_greeting
    print game.display.cursor.forward(4)
    game.start_game_prompt(game)
    print game.display.cursor.forward(4)
    game.display.print_board(controller.turns, controller.turns[-1], controller.guesses, controller.feedback, secret_code, controller.this_round_over)
    # game.display.print_board
    game.display.prompt_for_turn
    print game.display.cursor.move(71, 1)
    return secret_code
  end
  
  def the_round_loop(game, secret_code)
    guess = game.controller.guesses[-1]
    game.controller.this_round_over = false
    until game.controller.round_over?(guess, secret_code, game.controller.turns[-1], game.controller.turns)
      game.controller.process_codebreaker_input(secret_code)
      game.display.print_board(game.controller.turns, game.controller.turns[-1], game.controller.guesses, game.controller.feedback, secret_code, controller.this_round_over)
      guess = game.controller.guesses[-1]
      unless guess == secret_code || game.controller.turns == []
        game.display.prompt_for_turn
        print game.display.cursor.move(71, 1)
      end
    end
    game.controller.this_round_over = true
    secret_code
  end
  
  def broken_first_turn?(game)
    return true if game.controller.turns[-1] == 2
  end
  
  def code_not_broken?(game)
    return true if game.controller.turns == []
  end
  
  def calcuate_points(game)
    controller = game.controller
    round_end_options = ['first_turn', 'broken', 'not_broken']
    if broken_first_turn?(game)
      controller.maker_points << -1
      controller.breaker_points << 10
      round_end_options[0]
    elsif code_not_broken?(game)
      controller.maker_points << 11
      controller.breaker_points << 0
      round_end_options[2]
    else
      controller.maker_points << 10 - controller.turns.size
      controller.breaker_points << controller.turns.size
      round_end_options[1]
    end
  end
  
  def after_round(game, computer)
    # puts "game.controller.turn: #{game.controller.turns[-1]}
    @display.print_round_over(game, calcuate_points(game))
    finished_round = game.controller.next_round(game)
    @display.print_game_state(game, finished_round)
    # secret_code = computer.generate_new_code
    # print_game_over(game) if game.controller.rounds == []
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