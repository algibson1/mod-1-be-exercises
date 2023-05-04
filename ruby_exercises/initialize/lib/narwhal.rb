class Narwhal
    attr_reader :name, :cute, :weight
    def initialize(hash)
        @cute = hash[:cute]
        @weight = hash[:weight]
        @name = hash[:name]
    end
    def cute?
        @cute
    end
end