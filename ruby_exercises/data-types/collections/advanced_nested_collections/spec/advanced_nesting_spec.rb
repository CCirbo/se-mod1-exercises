require_relative 'nesting'
require 'pry'

# The intent of this exercise is to practice working with nested collections.
# Some tests will be able to pass without any enumeration, and others will require
# more complex iteration over multiple portions of the nested collection.

# All tests can be completed without using any enumerable other than #each.
# My suggestion would be to complete all tests using only #each, and then
# to go back over each test and refactor it using a different enumerable.

# The collection you're going to be using lives in ./nesting.rb and is called stores.
# If you spot an error or want to make this exercise better, please let us know!


RSpec.describe 'Advanced Nested Collections' do
  it 'test 1' do
    # EXAMPLE
    employees = stores[:olive_garden][:employees]

    expected = ["Jeff", "Zach", "Samantha"]
    expect(employees).to eq(expected)
  end

  it 'test 1.5' do
    # EXAMPLE
    employees = stores[:olive_garden].fetch(:employees)

    expected = ["Jeff", "Zach", "Samantha"]
    expect(employees).to eq(expected)
  end

   it 'test 2' do
    # binding.pry  don't forget keys, very helpful like stores.keys, stores[:dennys].keys
  
    # Find the ingredients for pancakes
    pancake_ingredients = stores[:dennys][:dishes][0][:ingredients]

    expected = ["Flour", "Eggs", "Milk", "Syrup"]
    expect(pancake_ingredients).to eq(expected)
  end

  it 'test 2.5' do
    # binding.pry  don't forget keys, very helpful like stores.keys, stores[:dennys].keys
  
    # Find the ingredients for pancakes
    pancake_ingredients = stores[:dennys][:dishes].first[:ingredients]

    expected = ["Flour", "Eggs", "Milk", "Syrup"]
    expect(pancake_ingredients).to eq(expected)
  end

 

   it 'test 3' do
    # Find the price of risotto
    
    risotto_price = stores[:olive_garden][:dishes].first[:price]

    expect(risotto_price).to eq(12)
  end

  it 'test 3.5' do
    # Find the price of risotto
   
    risotto_price = stores[:olive_garden][:dishes][0][:price]

    expect(risotto_price).to eq(12)
  end

   it 'test 4' do
    # Find the ingredients for a Big Mac
 
    big_mac_ingredients = stores[:macdonalds][:dishes].first[:ingredients]

    expected = ['Bun','Hamburger','Ketchup','pickles']
    expect(big_mac_ingredients).to eq(expected)
  end

  it 'test 4.5' do
    # Find the ingredients for a Big Mac
   
    big_mac_ingredients = stores[:macdonalds][:dishes][0][:ingredients]

    expected = ['Bun','Hamburger','Ketchup','pickles']
    expect(big_mac_ingredients).to eq(expected)
  end

  it 'test 4.7' do
    # Find the ingredients for a Big Mac
   
    big_mac_ingredients = stores[:macdonalds][:dishes].find(name: "Big Mac").first[:ingredients]

    expected = ['Bun','Hamburger','Ketchup','pickles']
    expect(big_mac_ingredients).to eq(expected)
  end

   it 'test 5' do
    # Find a list of restaurants
    store_names = stores.keys

    expected = [:olive_garden, :dennys, :macdonalds]
    expect(store_names).to eq(expected)
  end

   it 'test 6' do
    # Find dishes names for Olive Garden
    #map does not need an accumulator because it returns a new array with the elements wanted
    
    dishes_names = stores[:olive_garden][:dishes].map {|dish| dish[:name]}
    
    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 6.5' do
    # Find dishes names for Olive Garden
        dishes_names = []   #each always needs an accumulator because it returns the same array, not a new one
        stores[:olive_garden][:dishes].each do |dish|
      dishes_names << dish[:name]
    end
    
    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 6.7' do
    # Find dishes names for Olive Garden
        dishes_names = stores[:olive_garden][:dishes].map do |dish|
        dish[:name]
    end
    
    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 7' do
    # Return a list of employees across
    # all restaurants
    # require 'pry'; binding.pry
    employee_names = stores.values.map {|value| value[:employees]}.flatten

    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.2' do
    # Return a list of employees across
    # all restaurants
    # require 'pry'; binding.pry
    employee_names = stores.values.flat_map {|value| value[:employees]}

    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end



     it 'test 7.3' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = []
    stores.each do |key, value|
           
     employee_names << value[:employees]
     
    end
    employee_names.flatten!   #had to use the bang to create a new array with the flatten names
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.4' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = []
    stores.each do |key, value|
           
     employee_names << value[:employees]
     
    end
    employee_names = employee_names.flatten   
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.5' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = []
    stores.each do |key, value|
           
    employee_names.concat(value[:employees])
     
    end
     
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.7' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = stores.flat_map {|key, value| value[:employees]}
           
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.8' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = stores.map {|key, value| value[:employees]}.flatten
           
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.9' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = stores.map do |key, value|
      value[:employees]
    end.flatten
           
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 7.9.5' do
    # Return a list of employees across
    # all restaurants
    
    employee_names = stores.flat_map do |key, value|
      value[:employees]
    end
           
    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end


    it 'test 8' do
    # Return a list of all ingredients
    # across all restaurants
    #   WILL WORK THE SAME WITH EACH AS WITH EACH_PAIR
   
    all_ingredients = []
    ingredients = stores.each_pair do |store, data|
      data[:dishes].each do |dish|

       all_ingredients << dish[:ingredients]
      end   
     end
    ingredients = all_ingredients.flatten
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end

  it 'test 8.3' do
    # Return a list of all ingredients
    # across all restaurants
   
    all_ingredients = []
    ingredients = stores.each_pair do |store, data|
      data[:dishes].each do |dish|
      
       all_ingredients.concat(dish[:ingredients])
      end   
     
    end
    ingredients = all_ingredients
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end

  it 'test 8.4' do
    # Return a list of all ingredients
    # across all restaurants
   
  ingredients = []
   stores.each_pair do |store, data|
      data[:dishes].each do |dish|

       ingredients << dish[:ingredients]
     
      end   
     
    end
    ingredients = ingredients.flatten
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end

  it 'test 8.6' do
    # Return a list of all ingredients
    # across all restaurants
   
  ingredients = []
   stores.each_pair do |store, data|
      data[:dishes].each do |dish|

        ingredients.concat(dish[:ingredients])
     
      end   
     
    end
    # ingredients 
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end

  it 'test 8.7' do
    # Return a list of all ingredients
    # across all restaurants

    # stores.values returns an array of store data, discarding the store keys.
    # flat_map is used to flatten the arrays while mapping over the store data and dishes.
    # The inner flat_map collects all the ingredients from each dish.
    # The result is a flat array of all ingredients across all restaurants.

  ingredients = stores.values.flat_map do |store_data|
  #  binding.pry
    store_data[:dishes].flat_map do |dish|
      # binding.pry
          dish[:ingredients]
      
     end
    end
   
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end


  it 'test 8.8' do
    # require 'pry'; binding.pry
  
    # Return a list of all ingredients
    # across all restaurants
    ingredients = stores.values.flat_map {|store_data| store_data[:dishes].flat_map {|dish| dish[:ingredients]}}
    
    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end
    
   it 'test 9' do
    # Return the full menu price for Olive Garden
   
    full_menu_price = stores[:olive_garden][:dishes].map do |dish|
      #  binding.pry
         dish[:price]
    end.sum 
 
    expect(full_menu_price).to eq(27)
  end

  it 'test 9.5' do
    # Return the full menu price for Olive Garden
     full_menu_price = stores[:olive_garden][:dishes].map {|dish| dish[:price]}.sum
   
     expect(full_menu_price).to eq(27)
  end

  it 'test 9.7' do
    # Return the full menu price for Olive Garden
    full_menu_price = 0

     stores[:olive_garden][:dishes].each do |dish|
      full_menu_price += dish[:price]
      
      end
  
     expect(full_menu_price).to eq(27)
  end

  it 'test 9.9' do
    # Return the full menu price for Olive Garden

    # reduce needs an arguement, in this case 0 since we are adding prices
    # collection is the arguement we are passing in with reduce so at first, collection is 0
    # until prices are added to it.

     full_menu_price = stores[:olive_garden][:dishes].reduce(0) do |collection, dish|
       
      collection += dish[:price]
      
      end
  
     expect(full_menu_price).to eq(27)
  end
 
 
   it 'test 10' do
    # Return the full menu for Olive Garden
    olive_garden_menu = {}
    stores[:olive_garden][:dishes].each do |dish|
      olive_garden_menu[dish[:name]] = dish
      # binding.pry
    end
   
     expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      }
    }
    expect(olive_garden_menu).to eq(expected)
  end

  it 'test 10.5' do
    # Return the full menu for Olive Garden

    # stores[:olive_garden][:dishes].map is used to transform each dish into a key-value pair array 
    # where the key is the dish's name and the value is the dish hash.
    # to_h is called on the resulting array to convert it into a hash.
    # This way, you avoid using each and directly construct the olive_garden_menu hash using map and to_h.

    olive_garden_menu = stores[:olive_garden][:dishes].map do |dish|
      [dish[:name], dish]
      # binding.pry
    end.to_h
   
     expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      }
    }
    expect(olive_garden_menu).to eq(expected)
  end

  it 'test 10.8' do
    # Return the full menu for Olive Garden
    # require 'pry'; binding.pry
    olive_garden_menu = stores[:olive_garden][:dishes].map {|dish| [dish[:name], dish]}.to_h
    
    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      }
    }
    expect(olive_garden_menu).to eq(expected)
  end

   it 'test 11' do
    # Return a full menu across all restaurants
    full_menu = {}
    stores.each do |store, data|
       data[:dishes].each do |dish|
        full_menu[dish[:name]] = dish
       end
      end

    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      },
      "Pancakes" => {
        :name => "Pancakes",
        :ingredients => ["Flour", "Eggs", "Milk", "Syrup"],
        :price => 10
      },
      "Waffles" => {
        :name => "Waffles",
        :ingredients => ["Flour", "Eggs", "Syrup"],
        :price => 7
      },
      "Big Mac" => {
        :name => "Big Mac",
        :ingredients => ["Bun", "Hamburger", "Ketchup", "pickles"],
        :price => 5
      },
      "Fries" => {
        :name => "Fries",
        :ingredients => ["Potatoes", "Salt"],
        :price => 2
      }
    }
    expect(full_menu).to eq(expected)
  end

  it 'test 11.5' do
    # Return a full menu across all restaurants

    # stores.flat_map is used to iterate over each store and its data.
    # For each store, data[:dishes].map is used to transform each dish into a key-value pair array 
    # where the key is the dish's name and the value is the dish hash.
    # The result of flat_map is a flat array of key-value pairs, which is then 
    # converted into a hash using to_h.  
    
    full_menu = stores.flat_map do |store, data|
      data[:dishes].map do |dish|
      [dish[:name], dish]
      # binding.pry
      end
    end.to_h
    
    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      },
      "Pancakes" => {
        :name => "Pancakes",
        :ingredients => ["Flour", "Eggs", "Milk", "Syrup"],
        :price => 10
      },
      "Waffles" => {
        :name => "Waffles",
        :ingredients => ["Flour", "Eggs", "Syrup"],
        :price => 7
      },
      "Big Mac" => {
        :name => "Big Mac",
        :ingredients => ["Bun", "Hamburger", "Ketchup", "pickles"],
        :price => 5
      },
      "Fries" => {
        :name => "Fries",
        :ingredients => ["Potatoes", "Salt"],
        :price => 2
      }
    }
    expect(full_menu).to eq(expected)
  end
end
