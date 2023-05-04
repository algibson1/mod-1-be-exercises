class LeatherChair
    def initialize
        @light_exposure = 0
    end
    def faded?
        @light_exposure > 0
    end
    def expose_to_sunlight
        @light_exposure += 1
    end
end