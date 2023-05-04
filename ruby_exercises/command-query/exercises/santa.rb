class Santa
    def initialize
        @cookies = 0
    end
    def fits?
        @cookies < 15
    end
    def eats_cookies
        @cookies += 5
    end
end