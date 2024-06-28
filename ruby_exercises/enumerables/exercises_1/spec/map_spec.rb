RSpec.configure do |config|
  config.formatter = :documentation 
  end



RSpec.describe 'map' do

  it 'capitalizes' do
    names = ["alice", "bob", "charlie"]
    capitalized_names = names.map do |name|
      name.capitalize
    end
    expect(capitalized_names).to eq(["Alice", "Bob", "Charlie"])
  end


  it 'capitalizes2' do
    names = ["alice", "bob", "charlie"]
    capitalized_names = names.map {|name| name.capitalize}
      
    expect(capitalized_names).to eq(["Alice", "Bob", "Charlie"])
  end

  it 'capitalizes' do
    names = ["alice", "bob", "charlie"]
    capitalized_names = names.map(&:capitalize)
      
    expect(capitalized_names).to eq(["Alice", "Bob", "Charlie"])
  end

    it 'doubles' do
    numbers = [1, 2, 3, 4, 5]
    doubles = numbers.map do |number|
      number * 2
     
    end
    expect(doubles).to eq([2, 4, 6, 8, 10])
  end

  it 'doubles2' do
    numbers = [1, 2, 3, 4, 5]
    doubles = numbers.map {|number| number * 2}
     
    expect(doubles).to eq([2, 4, 6, 8, 10])
  end

   it 'squares' do
    numbers = [1, 2, 3, 4, 5]
   squares = numbers.map do |number|
    number ** 2
   end
    expect(squares).to eq([1, 4, 9, 16, 25])
  end

   it 'lengths' do
    names = ["alice", "bob", "charlie", "david", "eve"]
    lengths = names.map(&:size)
    expect(lengths).to eq([5, 3, 7, 5, 3])
  end

  it 'lengths2' do
    names = ["alice", "bob", "charlie", "david", "eve"]
    lengths = names.map {|name| name.size}
    expect(lengths).to eq([5, 3, 7, 5, 3])
  end


   it 'normalize zip codes' do
    numbers = [234, 10, 9119, 38881]
    zip_codes = numbers.map do |number|
      number.to_s.rjust(5, '0')
    end
    expect(zip_codes).to eq(["00234", "00010", "09119", "38881"])
  end

  it 'normalize zip codes2' do
    numbers = [234, 10, 9119, 38881]
    zip_codes = numbers.map {|number| number.to_s.rjust(5, '0')}
     
    expect(zip_codes).to eq(["00234", "00010", "09119", "38881"])
  end

  
  it 'backwards' do
    names = ["alice", "bob", "charlie", "david", "eve"]
    backwards = names.map do |name|
      name.reverse
    end
    expect(backwards).to eq(["ecila", "bob", "eilrahc", "divad", "eve"])
  end

   it 'words with no vowels' do
    words = ["green", "sheep", "travel", "least", "boat"]
    without_vowels = words.map do |word|
      word.delete("aeiou")
    end
    expect(without_vowels).to eq(["grn", "shp", "trvl", "lst", "bt"])
  end

  it 'words with no vowels2' do
    words = ["green", "sheep", "travel", "least", "boat"]
    without_vowels = words.map {|word| word.delete("aeiou")}
      
    expect(without_vowels).to eq(["grn", "shp", "trvl", "lst", "bt"])
  end

   it 'trims last letter' do
    animals = ["dog", "cat", "mouse", "frog", "platypus"]
    trimmed = animals.map do |animal|
      animal[0...-1]
    end
    expect(trimmed).to eq(["do", "ca", "mous", "fro", "platypu"])
  end

  it 'trims last letter2' do
    animals = ["dog", "cat", "mouse", "frog", "platypus"]
    trimmed = animals.map {|animal| animal[0...-1]}
        
    expect(trimmed).to eq(["do", "ca", "mous", "fro", "platypu"])
  end
end

