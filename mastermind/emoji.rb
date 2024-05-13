🟦
🟥
🟩
🟨
# empty peg holes
⬛
# secret code space
⬜

# feedback pegs
▪️
▫️
⊠▢
◪⃞ ■⃞ □⃞ 🚫
# code pegs
⚫
⚪
🔴
🔵
🟢
🟡
🟠
🟣

# empty feedback hole
◪

code_pegs_copy = [ '🔴', '🟡 ', '🔵', '🟢 ', '🟣 ', '🟠 ' ]
new_code = []
until new_code.size == 4
  random_peg = code_pegs_copy.sample
  new_code << random_peg
  code_pegs_copy.delete(random_peg)
end
puts new_code

# Define the array of color emojis
code_pegs = ['🔴', '🟡', '🔵', '🟢', '🟣', '🟠']

# Define a hash mapping characters to indices
char_to_index = {
  'r' => 0,
  'y' => 1,
  'b' => 2,
  'g' => 3,
  'p' => 4,
  'o' => 5
}

# Prompt the user to choose a color
puts "Choose a color (r/y/b/g/p/o):"

# Get user input
user_input = gets.chomp.downcase

# Validate the input and get the selected color
if char_to_index.key?(user_input)
  selected_index = char_to_index[user_input]
  selected_color = code_pegs[selected_index]
  puts "You selected: #{selected_color}"
else
  puts "Invalid selection!"
end
