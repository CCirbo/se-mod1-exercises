class Vampire
    attr_reader :name,
                :pet,
                :thirsty,
                :drink

    def initialize(name, pet = "bat")
        @name = name
        @pet = pet
        @thirsty = true
        @drink = 0
    end

    def thirsty?
       @thirsty
    end

    def drink
        @drink += 1
        if @drink >= 1
            @thirsty = false
        end
    end
end

#could also do this, 
# def drink
# @thirsty = false
# end