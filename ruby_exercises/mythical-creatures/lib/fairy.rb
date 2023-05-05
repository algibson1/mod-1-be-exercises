class Fairy
    attr_reader :name, :collection
    def initialize(name)
        @name = name
        @collection = []
    end
    def collect(*thing)
        thing.each do |thing|
        return "Oops, someone else already has the #{thing.name}" if thing.collected == true
        @collection.push(thing) if thing.collected == false
        thing.collected = true if thing.collected == false
        end
    end
    def bless(child)
        return "This child is already blessed!" if child.blessed_by != nil
        return "I'm afraid I cannot bless you today, my dear #{child.name}..." if @collection.length < 3
        items = @collection.pop(3)
        item1 = items[0].name
        item2 = items[1].name
        item3 = items[2].name
        items.each do |item|
            item.enchanted = true
        end
        child.blessed
        child.take(items)
        child.blessed_by = self
        return "I bestow upon dear #{child.name} an enchanted #{item1}, #{item2}, and #{item3}"
    end
end

class ShinyThing
    attr_reader :name
    attr_accessor :collected, :enchanted
    def initialize(name)
        @name = name
        @collected = false
        @enchanted = false
    end
    def enchanted?
        @enchanted
    end
end

class Child
    attr_reader :name, :status, :fairy_gifts
    attr_accessor :blessed_by
    def initialize(name)
        @name = name
        @status = "unblessed"
        @fairy_gifts = nil
        @blessed_by = nil
    end
    def blessed
        @status = "This child has been blessed by a fairy!"
    end
    def take(items)
        @fairy_gifts = items
    end
end
