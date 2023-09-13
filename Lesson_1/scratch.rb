counter = 0

x = [1,2,3,4,5].map do |n|
  n * 2 
  counter += 1
  break if counter == 2
end

p x
