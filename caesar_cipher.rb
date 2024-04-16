# Make sure program was run with 2 command-line arguments
# Make sure the second argument is an int
unless ARGV.length == 2 && ARGV[1].to_i.to_s == ARGV[1]
  puts "Please provide 2 arguments"
  puts "Usage: ruby <script.rb> <string> <number>"
  exit
end

# assign variables from inputs
user_text = ARGV[0]
key = ARGV[1].to_i

# take in a letter and number, make sure spaces are spaces, rotate upper/lowercase letters and account for wrapping around from z-a.
def rotate(letter, num)
  if letter.chr == " "
    return " "
  elsif letter.chr == letter.chr.upcase
    ((letter.ord - 'A'.ord + num) %26 + 'A'.ord).chr
  elsif letter.chr == letter.chr.downcase
    ((letter.ord - 'a'.ord + num) %26 + 'a'.ord).chr
  else
    letter
  end
end

# go through each character 'byte' and rotate them.
text_to_int = user_text.each_byte.map do |c|
  rotate(c, key)
end

# print the final string
p text_to_int.join