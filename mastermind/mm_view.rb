class GameView
  attr_reader :cursor
  
  def initialize(code_pegs, key_pegs)
    @code_pegs = code_pegs
    @key_pegs = key_pegs
    @hidden_code = [ '⬜️', '⬜️', '⬜️', '⬜️' ]
    @cursor = TTY::Cursor
  end
  
  def round_loading_animation(game)
    spinner = TTY::Spinner.new("[:spinner] Generating new code for round: #{game.controller.rounds[-1]}...", format: :dots_2)
    spinner.auto_spin # Automatic animation with default interval
    sleep(5) # Perform task
    spinner.stop() # Stop animation
  end
  
  def print_game_state(game, finished_round)
    controller = game.controller
    breaker_score = "%02d" % game.controller.breaker_points.sum
    maker_score = "%02d" % game.controller.maker_points.sum
    if maker_score > breaker_score
      winner = 'maker'
      winner_points = maker_score
    elsif maker_score == breaker_score
      winner = 'tie'
      winner_points = maker_score
    else
      winner = 'breaker'
      winner_points = breaker_score
    end
    score = <<-SCORE_BOARD
    ╔═══════════════════════╗
    ║      SCORE BOARD      ║
    ╚═══════════════════════╝
    –––––––––––––––––––––––––
    |  MAKER   |   BREAKER  |
    –––––––––––––––––––––––––
    |    #{maker_score}    |     #{breaker_score}     |
    SCORE_BOARD
    
    current_game_state = <<-GAME_STATE
    That is the end of round #{finished_round}.
    There are #{controller.rounds.size} left.
    GAME_STATE
    
    final_score = winner == 'tie' ? "It's a tie. You both recieved #{winner_points}." : "#{winner.upcase} is the winner of this game with #{winner_points} points."
    
    end_game_state = <<-GAME_STATE
    The game is over. Here is the final score.
    #{final_score}
    Thanks for playing!
    GAME_STATE
    
    puts score
    puts ""
    if finished_round == 3
      puts end_game_state
    else
      puts current_game_state
    end
    puts ""
  end
  
  def print_next_round_prompt(game)
    play_prompt = <<-PLAY_PROMPT
    Get ready for round #{game.controller.rounds[-1]}.
    Type 'exit' (enter) to quit the game.
    PLAY_PROMPT
    puts play_prompt
    round_loading_animation(game)
  end
  
  def print_round_over(game, round_conclusion)
    # puts "round_conclusion: #{round_conclusion}"
    number_of_turns = game.controller.turns.size
    guesses = game.controller.guesses.size
    maker_round_points = game.controller.maker_points[-1]
    breaker_round_points = game.controller.breaker_points[-1]
    puts ""
    
    first_turn = <<-FIRST_TURN
    Well done, CODEBREAKER. You broke the code on your first attempt!
    Luck is on your side. 
    CODEBREAKER receives #{breaker_round_points} points!
    CODEMAKER   receives #{maker_round_points} points!
    FIRST_TURN
    
    code_broken = <<-CODE_BROKEN
    Well done, CODEBREAKER.
    You broke the code with #{number_of_turns} turns left…
    It took you #{guesses} guesses… 
    CODEBREAKER recieves #{breaker_round_points} points!
    CODEMAKER   receives #{maker_round_points} points!
    CODE_BROKEN
    
    code_not_broken = <<-CODE_NOT_BROKEN
    I'm sorry, CODEBREAKER. You didn't break the code 
    and receive #{breaker_round_points} points!
    CODEMAKER receives #{maker_round_points} points.
    CODE_NOT_BROKEN
    
    if round_conclusion == "first_turn"
      puts first_turn
    elsif round_conclusion == "broken"
      puts code_broken
    elsif round_conclusion == "not_broken"
      puts code_not_broken
    end
    puts ""
  end

  def board_title(secret_code, this_round_over)
    c1 = @hidden_code[0]
    c2 = @hidden_code[1]
    c3 = @hidden_code[2]
    c4 = @hidden_code[3]
    board_title_hide = <<-ROW
    ╔════════════════════════╗
    ║       MASTERMIND       ║
    ╚════════════════════════╝
    ––––––––––––––––––––––––––
    |#{c1}|#{c2}|#{c3}|#{c4}| SECRET CODE|
    ––––––––––––––––––––––––––
     ––––GUESSES–––– –FEEDBACK
    ROW
    
    board_title_show = <<-ROW
    
    ╔════════════════════════╗
    ║       MASTERMIND       ║
    ╚════════════════════════╝
    ––––––––––––––––––––––––––
    |#{secret_code[0]}|#{secret_code[1]}|#{secret_code[2]}|#{secret_code[3]}| SECRET CODE|
    ––––––––––––––––––––––––––
     ––––GUESSES–––– –FEEDBACK
    ROW
    # puts board_title_show
    if this_round_over == true
      puts board_title_show
    else
      puts board_title_hide
    end
  end

  def new_blank_board(secret_code)
    puts `clear`
      row_number = 10
      puts board_title(secret_code)
      10.times do
        row_number_str = "%02d" % row_number
        blank_code_row = <<-ROW
      ______________   ______
   #{row_number_str}  |⬛️|⬛️|⬛️|⬛️| - |◪||◪|
      ––––––––––––––   |◪||◪|
        ROW
        puts blank_code_row
        row_number -= 1
      end
  end

  def print_board(turns, turn, guesses, feedback, secret_code, this_round_over)
    puts `clear`
    row_number = 10
    guess_row_number = guesses.size
    guess = guesses[-1]
    board_title(secret_code, this_round_over)
    until row_number == 0
      row_number_str = "%02d" % row_number
      blank_code_row = <<-ROW
      ______________   ______
   #{row_number_str}  |⬛️|⬛️|⬛️|⬛️| - |•||•|
      ––––––––––––––   |•||•|
      ROW

      turn_row = <<-TURN_ROW
      ______________   ______
 • #{row_number_str}  |⬛️|⬛️|⬛️|⬛️| - |•||•|
      ––––––––––––––   |•||•|
      TURN_ROW

      if row_number < 1
        break
      elsif row_number == turn
        puts turn_row
      elsif row_number <= guess_row_number
        print_guess_row(guesses, guess_row_number, feedback)
        guess_row_number -= guesses.size
        row_number -= guesses.size
      else
        puts blank_code_row
      end
      row_number -= 1
    end
    puts ""
  end
  
  def print_guess_row(guesses, guess_row_number, feedback)
    guesses.zip(feedback).reverse_each do |guess, fb|
      row_number_str = "%02d" % guess_row_number
      guess_row = <<-ROW
      ______________   ______
   #{row_number_str}  |#{guess[0]}|#{guess[1]}|#{guess[2]}|#{guess[3]}| - |#{fb[3]}||#{fb[2]}|
      ––––––––––––––   |#{fb[1]}||#{fb[0]}|
        ROW
      guess_row_number -= 1
      puts guess_row
    end
    guess_row_number
  end
  
  def print_greeting
    puts `clear`
    greeting = <<-GREETING
    
    Welcome to MASTERMIND: codemaker vs. codebreaker
    Type: 
    - 'help' and hit (enter/return) if you'd like to see the instructions.
    - 'play' and hit (enter/return) to start the game.
    - 'exit' and hit (enter/return) to leave the game.
    
    GREETING
    puts greeting
  end
  
  def print_instructions
    puts `clear`
    instructions = <<-INSTRUCTIONS
    
    HOW TO PLAY: Mastermind is a fairly simple game. 
    The computer (CODEMAKER) has created a 4 color code using 6 colors. 
    Your job is to break the code (CODEBREAKER) in 10 GUESSES or less.
    
    NOTE: These are the 6 colors the computer will use: 🔴 🟡 🔵 🟢 🟣 🟠 to make the code. 
    It's possible for colors to repeat.
    
    TURNS:
    - there are 10 turns/GUESSES. 
    - each turn you will choose 4 colors as your guess and place them on the board.
    - use the first letter of each color to make a GUESS. r = 🔴, b = 🔵, and so on…
    - to GUESS: 🟡|🔵|🟢|🟣 , you would type: ybgp and hit (enter/return).
    
    FEEDBACK:
    - each turn, you will get feedback from the CODE MAKER
    - |■| = right color, right position. This is the most important feedback.
    - |□| = right color, wrong placement.
    - |•| = wrong color, wrong placement.
    - if see 4 |•|, none of your pegs are in the secret code.
    - the placement of the feedback pegs does not correspond to the placement of your pegs.
    
    POINTS:
    - the CODEMAKER gets a point for every GUESS you make.
    - the CODEBREAKER gets points for every GUESS remaining on the board.
    - if BREAKER guesses the code on the first try, -1 point for the MAKER, 10 points to BREAKER.
    - if BREAKER cannot GUESS the code in 10 GUESSES, 11 points to MAKER. 0 points to BREAKER.
    - breaking the code in 4 GUESSES would leave BREAKER with 6 points and the MAKER with 4.
    
    Type: 
    - 'play' and hit (enter/return) to play the game.
    - 'exit' and hit (enter/return) to not play the game.
    
    INSTRUCTIONS
    puts instructions
  end
  
  def prompt_for_turn
    puts <<-TURN
    
   Place your GUESS on the board.
   |COLORS: r🔴 y🟡 b🔵 g🟢 p🟣 o🟠
    
   To GUESS: 🟡|🔵|🟢|🟣, you would type: ybgp and hit "enter/return"…
   TURN
  end
  
  def invalid_turn_input
    puts ""
    puts "    Invalid GUESS. Please chose 4 colors."
    print "    To GUESS: 🟡|🔵|🟢|🟣, you would type: ybgp and hit 'enter/return'… "
  end
  
  def invalid_input
    puts "    Invalid response:"
    print "    Please type: 'help', 'play, or 'exit and 'enter/return'… "
  end
  
  def self.cursor
    @cursor
  end
end