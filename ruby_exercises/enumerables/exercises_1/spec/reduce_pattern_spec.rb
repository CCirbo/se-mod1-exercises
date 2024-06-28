RSpec.configure do |config|
  config.formatter = :documentation 
  end



RSpec.describe 'reduce pattern' do
  it 'sums a list of numbers' do
    numbers = [32, 1, 21, 5, 81, 333]
    sum = 0
    numbers.each do |number|
      sum = sum + number
    end
    expect(sum).to eq(473)
  end

   it 'subtracts a list of numbers' do
    numbers = [28, 12, 38, 1, 91]
    difference = 0
    numbers.each do |number|
     difference = difference - number
    end
    expect(difference).to eq(-170)
  end

  it 'multiplies a list of numbers' do
    numbers = [2, 3, 5, 7]
    product = 1
    numbers.each do |number|
      product = product * number
    end
    expect(product).to eq(210)
  end

   it 'capitalizes key words in phrase' do
    keywords = ["fish", "blue"]
    phrase = 'one fish two fish red fish blue fish'
    phrase = phrase.split.map do |word|
      # If the word is a keyword (case insensitive), 
      # replace it with its uppercase version
      if keywords.include?(word.downcase)
        word.upcase
      else
        word
      end
    end.join(" ")
  
    expect(phrase).to eq('one FISH two FISH red FISH BLUE FISH')
  end

  it 'capitalizes key words in phrase2' do
    keywords = ["fish", "blue"]
    phrase = 'one fish two fish red fish blue fish'
    keywords.each do |keyword|
      phrase.gsub!(/\b#{keyword}\b/i, keyword.upcase)
    end
    # # reduce is used to iterate over the keywords array, starting with 
    # the initial_value phrase.
    # # Inside the block, gsub is used to replace all occurrences of the 
    # keyword in the phrase with its uppercase version.
    # # The regular expression \b#{keyword}\b ensures that only whole words 
    # are matched (i.e., fish will not match fishing).
    # # The i modifier makes the match case-insensitive, so it will match 
    # fish, Fish, FISH, etc.
    # # The result is a string where all keywords are capitalized as specified.
    expect(phrase).to eq('one FISH two FISH red FISH BLUE FISH')
  end

  it 'capitalizes key words in phrase3' do
    keywords = ["fish", "blue"]
    phrase = 'one fish two fish red fish blue fish'
    # Split the phrase into words
  words = phrase.split
  
  # Map through each word
  words = words.map do |word|
    # Check if the word (case-insensitive) is in the keywords array
    if keywords.map(&:downcase).include?(word.downcase)
      # If it is, replace it with its uppercase version
      word.upcase
    else
      # Otherwise, leave the word unchanged
      word
      end
    end
  
  # Join the words back into a single string
  result = words.join(" ")
  
  expect(result).to eq('one FISH two FISH red FISH BLUE FISH')
  end

  it 'capitalizes key words in phrase4' do
    keywords = ["fish", "blue"]
    phrase = 'one fish two fish red fish blue fish'
    keywords.each do |keyword|
      phrase.gsub!("#{keyword}", keyword.upcase)
    end
    
    expect(phrase).to eq('one FISH two FISH red FISH BLUE FISH')
  end

 
  it 'divide 560 by a bunch of numbers' do
    numbers = [2, 2, 2, 5, 7]
    quotient = 560
   numbers.each do |number|
    quotient = quotient / number
   end
    expect(quotient).to eq(2)
  end

   it 'subtracts smallest numbers from 100' do
    elements = [[8, 5, 3], [1, 9, 11], [4, 7, 2], [19, 34, 6]]
    difference = 100
    elements.each do |element|
      smallest = element.min
      difference -= smallest
    end
    expect(difference).to eq(88)
  end

   it 'adds all second values together' do
    elements = [["a", 1], ["b", 9], ["c", 21]]
    sum = 0
    elements.each do |element|
      sum = sum + element[1]
    end
    expect(sum).to eq(31)
  end

end

