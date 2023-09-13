arr = ['10', '11', '9', '7', '8'] # sort in descending order

p arr.sort {|a,b| b.to_i <=> a.to_i}