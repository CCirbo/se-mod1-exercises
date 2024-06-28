class Bag
    attr_reader :candies,
                :count

    def initialize
        @candies = []
        @count = 0
    end

    def empty?
        @candies.empty?
    end

    def count
        @candies.count
    end

    def <<(candy)
        @candies << candy
    end

    def contains?(type)
        @candies.any? {|candy| candy.type == type}
    end

    def grab(type)
        index = @candies.find_index { |candy| candy.type == type }
        @candies.delete_at(index) if index
    end

    def take(number)
        taken = @candies.shift(number)
        taken
    end

    

   
end