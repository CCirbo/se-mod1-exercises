class Eel
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def name
            @name.gsub("Earl", "just another eel")
       
    end
end