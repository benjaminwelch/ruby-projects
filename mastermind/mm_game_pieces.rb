module GamePieces
  attr_reader :code_pegs, :key_pegs, :char_to_index, :secret_code
  
  def initialize
    @@code_pegs = [ '🔴', '🟡', '🔵', '🟢', '🟣', '🟠' ]
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