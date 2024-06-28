class Hobbit
    attr_reader :name,
                :disposition,
                :age,
                :short

    def initialize(name, disposition = "homebody")
        @name = name
        @disposition = disposition
        @age = 0
        @short = true
    end

    def celebrate_birthday
        @age += 1
    end

    def adult?
        @age > 32
    end

    def old?
        @age > 100
    end

    def has_ring?(name)
      @name == "Frodo"
    end

    def is_short?
        @short
    end

    
end