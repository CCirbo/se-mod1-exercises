RSpec.describe 'Any test' do
  it 'has at least one zero' do
    numbers = [2, 0, 9, 3, 0, 1]
    has_zero = numbers.any? do |number|
      number.zero?
    end
    expect(has_zero).to eq(true)
  end

  it 'has at least one zero2' do
    numbers = [2, 0, 9, 3, 0, 1]
    has_zero = numbers.any? {|number| number.zero?}
      
    expect(has_zero).to eq(true)
  end

  it 'has at least one zero3' do
    numbers = [2, 0, 9, 3, 0, 1]
    has_zero = numbers.any?(&:zero?)
      
    expect(has_zero).to eq(true)
  end

   it 'does not have zeroes' do
    numbers = [3, 1, 3, 2, 4, 9, 8]
    has_zero = numbers.any? do |number|
     number.zero?
    end
    expect(has_zero).to eq(false)
  end

  it 'does not have zeroes2' do
    numbers = [3, 1, 3, 2, 4, 9, 8]
    has_zero = numbers.any? {|number| number.zero?}
   
    expect(has_zero).to eq(false)
  end

   it 'has at least one alice' do
    names = ["Bill", "Bob", "Burton", "Alice", "Brandon"]
    has_alice = names.any? {|name| name.include?("Alice")}
    expect(has_alice).to eq(true)
  end

  it 'no alices' do
    names = ["Chuck", "Charlene", "Cory", "Chris", "Carl"]
    has_alice = names.any? {|name| name.include?("Alice")}
    expect(has_alice).to eq(false)
  end

   it 'has a multi word phrase' do
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    multi_word_phrase = phrases.any? {|phrase| phrase.split.size > 1}
    expect(multi_word_phrase).to eq(true)
   
  end

  it 'has a multi word phrase2' do
    phrases = ["Sure!", "OK.", "I have no idea.", "Really? Whatever."]
    
    has_multi_word_phrase = phrases.any? { |phrase| phrase.match?(/\s/) }
  
    expect(has_multi_word_phrase).to eq(true)
     # phrases.any? { |phrase| phrase.match?(/\s/) }: This uses the any? method to iterate through
    #  each phrase in the phrases array.
    # phrase.match?(/\s/) checks if the current phrase contains any whitespace character (\s). If it does,
    # it means the phrase has more than one word.
    # expect(has_multi_word_phrase).to eq(true): Verifies if has_multi_word_phrase is true, 
    # meaning at least one phrase in the array has more than one word.
  end

   it 'no monkeys' do
    animals = ["elephant", "hippo", "jaguar", "python"]
    has_monkeys = animals.any? {|animal| animal.include?("monkeys")}
    expect(has_monkeys).to eq(false)
  end

   it 'no multiples of five' do
    numbers = [3, 1, 3, 2, 4, 9, 8]
   multiples_of_5 = numbers.any? {|number| number % 5 == 0}
    expect(multiples_of_5).to eq(false)

    # numbers.any? { |number| number % 5 == 0 }: This uses the any? method to iterate through 
    # each number in the numbers array.
    # number % 5 == 0 checks if the current number is divisible by 5 
    # (% is the modulo operator, which gives the remainder of division).
    # If any number satisfies number % 5 == 0, it means there is at 
    # least one multiple of five in the array.
    # expect(multiples_of_5).to eq(false): Verifies if multiples_of_5 is 
    # false, meaning there are no multiples of five in the array.
  end
end
