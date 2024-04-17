def stock_picker(prices)
  best_buy_price = prices[0]
  best_sell_price = prices[0]
  purchase_day = 0
  sell_day = 0
  prices.each_with_index do |buy_price, buy_day|
    (buy_day + 1...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      if sell_price - buy_price > best_sell_price - best_buy_price
        best_buy_price = buy_price
        best_sell_price = sell_price
        purchase_day = buy_day
        sell_day = sell_day
      end
    end
  end
  p [prices.index(best_buy_price), prices.index(best_sell_price)]
end

stock_picker([17,3,6,9,15,8,6,1,10])

# I tried so many things that didn't work and ended up using ChatGPT to sort it out. I learned about using .each with a range in the nested loop and how to update all the prices in one loop if they aren't the best combo.

# prices.each_with_index do |buy_price, buy_day|
#   # Iterate over prices starting from the next day after the buy day
#   (buy_day + 1...prices.length).each do |sell_day|
#     sell_price = prices[sell_day]
#     # Compare buy_price with sell_price and do some processing
#     # For example:
#     if sell_price > buy_price
#       puts "Buy at day #{buy_day}, sell at day #{sell_day}"
#     end
#   end
# end

# def is_after?(array, item1, item2)
# # Find the index of item1 and item2 in the array
# index1 = array.index(item1)
# index2 = array.index(item2)

#   if day < sell_day && bought == true
#   sell_day = day
# end

# prices.each do |day|
#   puts prices.index(day)
#   while purchase_day_idx > sell_day_idx && purchase_day_idx != prices[-1] && sell_day_idx != prices[0]
#     purchase_day = day
#     purchase_day_idx = prices.index(day)
#   end
# end

# while purchase_day > sell_day do
#   remaining_prices = prices.reject { |price| price == min_price }
#   purchase_day = remaining_prices.index(min_price)
#   puts purchase_day
# end