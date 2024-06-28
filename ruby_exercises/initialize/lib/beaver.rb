class Beaver
    attr_reader :name
                

    def initialize(name)
        @name = name
    end

    def name
        @name.concat(" ", "the Beaver")
    end
   
end
    # could do this also
    # def name
    #     @name << " " << "the Beaver"
    # end

# could do this but in initialize you would have
# to do @given_name = name and then the below
# def name
    #     @given_name + " " + "the Beaver"

    # end

    