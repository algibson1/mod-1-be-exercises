class Money
    attr_reader :amount
    def initialize
        @amount = 0
    end
    def earn(number)
        @amount += number
    end
end