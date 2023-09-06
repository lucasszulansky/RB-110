[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the block's return value is a boolean for each iteration
# the return value of any? in this code is true
# this code outputs 1 since any? stops iterating after the first block return is true