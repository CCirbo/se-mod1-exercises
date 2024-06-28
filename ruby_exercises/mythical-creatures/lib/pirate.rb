class Pirate
    attr_reader :name,
                :job

    def initialize(name, job = "Scallywag")
        @name = name
        @job = job
        @cursed = false
        @does_bad = 0
        @booty = 0
    end

    def cursed?
        @cursed
    end

    def commit_heinous_act
        @does_bad += 1
        if @does_bad >= 3
            @cursed = true
        end
    end

    def booty
        @booty
    end

    def rob_ships
       @booty += 1
    end



end