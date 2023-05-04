class Water
    attr_reader :temperature
    def initialize
        @temperature = 295
    end
    def heat
        @temperature += 1
    end
    def cool 
        @temperature -= 1
    end
    def state
        return "Solid- Icy!" if @temperature < 273
        return "Gas- Steamy!" if @temperature > 373
        return "Liquid- Wet!" if @temperature.between?(273, 373)
    end
end