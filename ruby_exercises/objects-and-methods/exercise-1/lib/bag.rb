class Bag
    attr_reader :candies
    
    def initialize
      
        @candies = []
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
    # candies is our group, candy is in the group
    #  we are looking for whatever type of candy that is in
    #  the candies group so type is the argument we are looking
    # for and passing in. We have to look through the group
    #  of candies with any? to find candy, then candy.type
    # to find the type we have passed in, to evaluate true or false
    @candies.any? {|candy| candy.type == type}
  
    end
end