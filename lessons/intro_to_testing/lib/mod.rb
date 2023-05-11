class Mod
    attr_reader :name, :description, :students
    def initialize(name, description)
        @name = name
        @description = description
        @students = []
    end
    def add_student(student)
        @students << student
    end
    def capitalized_student_names
        @students.map {|student| student.name.capitalize}
    end
    def alphabetical_student_names
        capitalized_student_names.sort
    end
end