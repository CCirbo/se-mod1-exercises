class Cat
    attr_reader :name,
                :sound

    def initialize(name)
        @name = name
        @sound = sound
    end

    def sound
        @sound = "meow"
    end

end