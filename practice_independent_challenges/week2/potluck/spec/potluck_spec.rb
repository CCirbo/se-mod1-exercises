require './lib/dish'
require './lib/potluck'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation 
    end

    describe Potluck do
        describe '#initialize' do
          it 'is a potluck' do
            potluck = Potluck.new("7-13-18")
            expect(potluck).to be_a Potluck
          end
      
          it 'can read the date' do
            potluck = Potluck.new("7-13-18")
            expect(potluck.date).to eq ("7-13-18")
          end
      
          it 'has an empty array as default for dishes' do
            potluck = Potluck.new("7-13-18")
            expect(potluck.dishes).to eq([])
          end

          it 'add dishes to the dish array' do
            potluck = Potluck.new("7-13-18")
            couscous_salad = Dish.new("Couscous Salad", :appetizer)
            cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

            potluck.add_dish(couscous_salad)
            potluck.add_dish(cocktail_meatballs)

            expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
          end

          it 'can determine how many dishes in the array' do
            potluck = Potluck.new("7-13-18")
            couscous_salad = Dish.new("Couscous Salad", :appetizer)
            cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

            potluck.add_dish(couscous_salad)
            potluck.add_dish(cocktail_meatballs)

            expect(potluck.dishes.length).to eq(2)
          end

          
        end
    end