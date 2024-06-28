class Wizard
    attr_reader :name,
                :bearded,
                :rested,
                :cast

    def initialize(name, bearded: true)
        @name = name
        @bearded = bearded
        @rested = true
        @cast = 0
    end

    def bearded?
        @bearded
    end

    def incantation(saying)
        incantation = 'sudo' + " " + "#{saying}"
    end

    def rested?
        @rested = @cast < 3
    end

    def cast
        @cast += 1
        "MAGIC MISSILE!"
        # this works because ruby returns the last line of the method
    end
end

# other ways of doing it below. all work
# def rested?
# return false if @rested >= 3 (this is a guard clause)
# true
# end



# def rested?
#     @rested = false if @cast >= 3
#     @rested
#   end
# Explanation:
# Initialization:

# @cast is initialized to 0.
# @rested is initialized to true.
# Casting a Spell:

# cast_spell increments the @cast counter by 1 each time a spell is cast.
# Rested Method:

# rested? sets @rested to false if @cast is 3 or more, 
# and returns the value of @rested.

# # class Wizard
# attr_reader :name, :rested

# def initialize(name)
#   @name = name
#   @cast = 0
#   @rested = true
# end

# def cast_spell
#   @cast += 1
# end

# # Alternative 1
# def rested?
#   @rested = @cast < 3 ? true : false
# end

# # Alternative 2
# def rested?
#   @rested = @cast < 3
# end

# # Alternative 3
# def rested?
#   @rested = true && @cast < 3
# end

# # Alternative 4
# def rested?
#   return false if @cast >= 3
#   true
# end
# end
