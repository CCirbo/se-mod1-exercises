class Unicorn
    attr_reader :name,  
                :color


    def initialize(name, color = "silver")
        @name = name
        @color = color
    end

    def silver?
        @color == "silver"
    end

    def say(phrase)
        "**;* #{phrase} **;*"
    end
end
# other ways of doing it
# def silver?
#     return true if @color == "silver"  #Guard Clause
#     false


#    if @color == "silver"
#         true
#    else 
#         false
#    end  