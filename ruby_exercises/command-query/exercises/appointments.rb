class Appointments
    def initialize
        @appts = []
    end
    def earliest
        @appts.sort.first
    end
    def at(time)
        @appts << time
    end
end