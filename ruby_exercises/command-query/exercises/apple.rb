class Apple
    def initialize
        @weeks = 0
    end
    def ripe?
        return false if @weeks < 3
        return "Well it's OVERripe NOW!! You waited too long!" if @weeks >= 5
        return true if @weeks.between?(3,5)
    end
    def wait_a_week
        @weeks += 1
    end
end