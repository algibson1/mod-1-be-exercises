class Wallet
    def initialize
        @pocket = []
    end
    def cents
        total = 0
        @pocket.each do |coin|
            total += 1 if coin == :penny
            total += 5 if coin == :nickel
            total += 10 if coin == :dime
            total += 25 if coin == :quarter
        end
        total
    end
    def << coin
        @pocket.push(coin)
    end
    def take(*coins)
        coins.each do |coin|
            @pocket.delete_at(@pocket.index(coin) || @pocket.length)
        end
    end
end