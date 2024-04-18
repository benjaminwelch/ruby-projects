# found here: https://dzone.com/articles/swap-elements-array-ruby
class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def bubble_sort(array)
  counter = 1
  while counter != 0 do
    counter = 0
    (0...array.length - 1).each do |idx|
      if array[idx] > array[idx + 1]
        array.swap!(idx, idx + 1)
        counter += 1
      end
    end
  end
  p array
end

unsorted_array = [14, 72, 61, 89, 43, 19, 2, 71, 9, 81, 28, 99, 92, 7, 26, 41, 10, 63, 49, 58]

bubble_sort(unsorted_array)

# found this site while working on this: https://rubyalgo.github.io/algorithms/arrays/swapping-two-elements/ and highly recommend it.

# PAST ATTEMPTS:

# def bubble_sort(array)
#   array_first = array[0]
#   array_second = array[1]
#   counter = 1
#   next_item = array[-1]
#   while counter != 0 do
#     sorted_array = array.each_with_index.map do |item, idx|
#       counter = 0
#       if idx < array.length - 1
#         next_item = array[idx + 1]
#       end
#       if item > next_item
#         array.swap!(item,next_item)
#         counter += 1
#       end
#     end
#     puts "sorted_array: #{sorted_array}"
#   end
# end