class TrickOrTreater
    attr_reader :costume,
                :bag,
                :sugar_level

    def initialize(costume)
        @costume = costume
        @bag = Bag.new
        @sugar_level = 0
    end

    def dressed_up_as
        @costume.style        
    end

    def has_candy?
        !@bag.candies.empty?
    end

    def candy_count
        @bag.candies.count
    end

    def eat
       candy = @bag.candies.shift    #could also use pop
        @sugar_level += candy.sugar if candy
    end

   
end