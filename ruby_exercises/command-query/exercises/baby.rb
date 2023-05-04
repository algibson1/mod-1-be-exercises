class Baby
    def initialize
        @naps = 0
    end
    def tired?
        @naps == 0
    end
    def nap
        @naps += 1
    end
end