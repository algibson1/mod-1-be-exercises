class Children
    attr_reader :children
    def initialize
        @children = []
    end
    def eldest
        return nil if @children.empty?
        @children.sort_by do |child|
            child.age 
        end.last
    end
    def << child
        @children.push(child)
    end
end

class Child
    attr_reader :name, :age
    def initialize(name, age)
        @name = name
        @age = age
    end
end