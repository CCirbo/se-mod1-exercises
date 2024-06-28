RSpec.configure do |config|
  config.formatter = :documentation 
  end

RSpec.describe 'select' do

  it 'even numbers' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    evens = numbers.select do |number|
      number.even?
    end
    expect(evens).to eq([2, 4, 6, 8, 10])
  end

  it 'even numbers2' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    evens = numbers.select {|number| number.even?}
    
    expect(evens).to eq([2, 4, 6, 8, 10])
  end

  it 'even numbers3' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    evens = numbers.select(&:even?)
    
    expect(evens).to eq([2, 4, 6, 8, 10])
  end

   it 'odd numbers' do
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    odds = numbers.select do |number|
      number.odd?
    end
    expect(odds).to eq([1, 3, 5, 7, 9])
  end

    it 'odd numbers2' do
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      odds = numbers.select {|number| number.odd?}
       
      expect(odds).to eq([1, 3, 5, 7, 9])
    end

    it 'odd numbers3' do
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      odds = numbers.select(&:odd?)
       
      expect(odds).to eq([1, 3, 5, 7, 9])
    end

   it 'words with three letters' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.select do |word|
      word.size == 3
    end
    expect(selected).to eq(["bad", "cat", "dog", "red"])
  end

  it 'words with three letters2' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.select {|word| word.size == 3}
     
    expect(selected).to eq(["bad", "cat", "dog", "red"])
  end

    it 'words with more than three letters' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.select {|word| word.size > 3}

    expect(selected).to eq(["pill", "finger", "blue", "table"])
  end

  it 'words with more than three letters2' do
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    selected = words.select do |word|
      word.size > 3
    end

    expect(selected).to eq(["pill", "finger", "blue", "table"])
  end


   it 'wordss ending in e' do
    words = ["are", "you", "strike", "thinking", "belt", "piece", "warble", "sing", "pipe"]
   selected = words.select do |word|
    word.end_with? "e"
   end
    expect(selected).to eq(["are", "strike", "piece", "warble", "pipe"])
  end

  it 'wordss ending in e2' do
    words = ["are", "you", "strike", "thinking", "belt", "piece", "warble", "sing", "pipe"]
   selected = words.select { |word| word.end_with? "e"}
   
    expect(selected).to eq(["are", "strike", "piece", "warble", "pipe"])
  end

   it 'words ending in ing' do
    words = ["bring", "finger", "drought", "singing", "bingo", "purposeful"]
    selected = words.select { |word| word.end_with? "ing"}

    expect(selected).to eq(["bring", "singing"])
  end

   it 'words containing e' do
    words = ["four", "red", "five", "blue", "pizza", "purple"]
    selected = words.select { |word| word.include? "e"}
    expect(selected).to eq(["red", "five", "blue", "purple"])
  end

   it 'dinosaurs' do
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
    dinosaurs = animals.select { |animal| animal.end_with? "rus"}
    expect(dinosaurs).to eq(["tyrannosaurus", "achillesaurus", "qingxiusaurus"])
  end

   it 'floats' do
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    floats = numbers.select {|number| number.is_a?(Float)}
    expect(floats).to eq([1.4, 3.5, 4.9, 9.1, 8.0])
  end

   it 'arrays' do
    elements = ["CAT", ["dog"], 23, [56, 3, 8], "AIMLESS", 43, "butter"]
    arrays = elements.select {|element| element.is_a?(Array)}
    expect(arrays).to eq([["dog"], [56, 3, 8]])
  end

   it 'hashes' do
    elements = ["cat", {:dog=>"fido"}, 23, {:stuff=>"things"}, "aimless", 43]
    hashes = elements.select {|element| element.is_a?(Hash)}
    expect(hashes).to eq([{:dog=>"fido"}, {:stuff=>"things"}])
  end
end
