def substrings(string, dict)
  substrings_found = Hash.new
  dict.each do |item|
    if string.include?(item) && substrings_found[item] == nil
      # this uses .scan to find an array of matches, the length of that array is the "count" for that substring.
      substrings_found[item] = string.scan(item).length
    end
  end
  puts substrings_found
end

word = ""
while word.strip.empty?
  puts "Please give me a word or words: "
  word = gets.chomp.downcase
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings(word, dictionary)