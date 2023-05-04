class RollCall
    def initialize
        @names = []
    end
    def << name
        @names.push(name)
    end
    def longest_name
        @names.sort_by do |name|
            name.length
        end.last
    end
end
