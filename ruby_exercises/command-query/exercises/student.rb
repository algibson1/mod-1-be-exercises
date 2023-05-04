class Student
    @@grades = ["A", "B", "C", "D", "F"]
    attr_reader :grade, :score
    def initialize
        @score = 2
    end
    def grade
        @@grades[@score]
    end
    def study
        @score -= 1
        @score = 0 if @score < 0
    end
    def slack_off
        @score += 1
        @score = 4 if @score > 4
    end
end