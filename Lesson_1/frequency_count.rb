statement = "The Flintstones Rock"

characters = statement.delete(' ').chars

frequency = characters.each_with_object({}) {|char, hash| hash[char] = (characters.count(char))}

p frequency

