hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = "aeiou"

hsh.each do |_, words|
  words.each do |word|
    word.chars.each do |letter|
      puts letter if VOWELS.include?(letter)
    end
  end
end

