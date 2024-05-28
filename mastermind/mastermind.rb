# frozen_string_literal: true

require 'pry-byebug'
require 'tty-spinner'
require "tty-cursor"
cursor = TTY::Cursor
require_relative 'mm_view'
require_relative 'mm_controller' # view
require_relative 'mm_model' # view
require_relative 'mm_game_pieces'

game = GameLoop.new
computer = Computer.new
secret_code = computer.generate_new_code
c = game.controller
game.start_game(game, secret_code)

game.the_round_loop(game, secret_code)
game.display.print_board(c.turns, c.turns[-1], c.guesses, c.feedback, secret_code, c.this_round_over)
game.after_round(game, computer)


secret_code = computer.generate_new_code
game.display.print_next_round_prompt(game)
game.display.print_board(c.turns, c.turns[-1], c.guesses, c.feedback, secret_code, c.this_round_over)
game.display.prompt_for_turn
print game.display.cursor.move(71, 1)
game.the_round_loop(game, secret_code)
game.display.print_board(c.turns, c.turns[-1], c.guesses, c.feedback, secret_code, c.this_round_over)
game.after_round(game, computer)

secret_code = computer.generate_new_code
game.display.print_next_round_prompt(game)
game.display.print_board(c.turns, c.turns[-1], c.guesses, c.feedback, secret_code, c.this_round_over)
game.display.prompt_for_turn
print game.display.cursor.move(71, 1)
game.the_round_loop(game, secret_code)
game.display.print_board(c.turns, c.turns[-1], c.guesses, c.feedback, secret_code, c.this_round_over)
game.after_round(game, computer)