RSpec.configure do |config|
  config.formatter = :documentation 
  end


RSpec.describe 'reject' do

  it 'removes zeroes' do
    numbers = [2, 93, 7, 0, 0, 1, 0, 31, 0, 368]
    filtered = numbers.reject do |number|
      number.zero?
    end
    expect(filtered).to eq([2, 93, 7, 1, 31, 368])
  end

  it 'removes zeroes2' do
    numbers = [2, 93, 7, 0, 0, 1, 0, 31, 0, 368]
    filtered = numbers.reject {|number| number.zero?}
     
    expect(filtered).to eq([2, 93, 7, 1, 31, 368])
  end

   it 'removes vowels' do
    # The regular expression /[aeiou]/ matches any single character that is a 
    # vowel (a, e, i, o, u).
    # The reject method iterates over the array, and for each element, it
    #  applies the block. If the block returns true (i.e., the letter is a vowel), 
    #  the element is rejected.
    # This results in an array with all vowels removed.

    letters = ["a", "l", "l", " ", "y", "o", "u", "r", " ", "b", "a", "s", "e", " ", "a", "r", "e", " ", "b", "e", "l", "o", "n", "g", " ", "t", "o", " ", "u", "s"]
    remaining = letters.reject {|letter| letter.match?(/[aeiouy]/)}
      # Your code goes here
   
    expect(remaining).to eq(["l", "l", " ", "r", " ", "b", "s", " ", "r", " ", "b", "l", "n", "g", " ", "t", " ", "s"])
  end

   it 'remove numbers divisible by 3' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    remaining = numbers.reject {|number| number % 3 == 0}
    expect(remaining).to eq([1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20])
  end

   it 'remove words longer tghan three letters' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.reject {|word| word.length > 3}
    expect(selected).to eq(["bad", "cat", "dog", "red"])
  end

   it 'remove words ending in e' do
    words = ["are", "you", "strike", "thinking", "belt", "piece", "warble", "sing", "pipe"]
    selected = words.reject {|word| word.end_with?("e")}
    expect(selected).to eq(["you", "thinking", "belt", "sing"])
  end

   it 'remove words ending in ing' do
    words = ["bring", "finger", "drought", "singing", "bingo", "purposeful"]
    selected = words.reject {|word| word.end_with?("ing")}
    expect(selected).to eq(["finger", "drought", "bingo", "purposeful"])
  end

   it 'remove words containing e' do
    words = ["four", "red", "five", "blue", "pizza", "purple"]
     selected = words.reject {|word| word.include?("e")}
    expect(selected).to eq(["four", "pizza"])
  end

   it 'remove dinosaurs' do
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
     notasaurus = animals.reject {|animal| animal.end_with?("rus")}
    expect(notasaurus).to eq(["narwhal", "eel"])
  end

   it 'remove numbers' do
    elements = ["cat", "dog", 23, 81.1, 56, "aimless", 43]
     not_numbers = elements.reject {|element| element.is_a?(Numeric)}
    expect(not_numbers).to eq(["cat", "dog", "aimless"])
  end

   it 'remove floats' do
    elements = ["cat", "dog", 32.333, 23, 56, "aimless", 43.2]
    not_numbers = elements.reject {|element| element.is_a?(Float)}
    expect(not_numbers).to eq(["cat", "dog", 23, 56, "aimless"])
  end

   it 'remove animals starting with a vowel' do
    animals = ["aardvark", "bonobo", "cat", "dog", "elephant"]
     remaining = animals.reject {|animal| animal.start_with?(/[aeiouy]/)}
    expect(remaining).to eq(["bonobo", "cat", "dog"])
  end

   it 'remove upcased words' do
    words = ["CAT", "dog", "AIMLESS", "Trevor", "butter"]
     remaining = words.reject {|word| word == word.upcase}
    expect(remaining).to eq(["dog", "Trevor", "butter"])
  end

   it 'remove arrays' do
    elements = ["CAT", ["dog"], 23, [56, 3, 8], "AIMLESS", 43, "butter"]
    remaining = elements.reject {|element| element.is_a?(Array)}
    expect(remaining).to eq(["CAT", 23, "AIMLESS", 43, "butter"])
  end

   it 'remove hashes' do
    elements = ["cat", {:dog=>"fido"}, 23, {:stuff=>"things"}, "aimless", 43]
     remaining = elements.reject {|element| element.is_a?(Hash)}
    expect(remaining).to eq(["cat", 23, "aimless", 43])
  end
end
