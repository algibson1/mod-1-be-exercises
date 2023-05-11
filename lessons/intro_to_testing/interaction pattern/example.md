```ruby
pry(main)> require './lib/student'
=> true

pry(main)> student = Student.new('Penelope')
=> #<Student:0x007fa71e12c1f0 @cookies=[], @name="Penelope">

pry(main)> student.name
=> "Penelope"

pry(main)> student.cookies
=> []

pry(main)> student.add_cookie('Chocolate Chunk')
pry(main)> student.add_cookie('Snickerdoodle')

pry(main)> student.cookies
=> ["Chocolate Chunk", "Snickerdoodle"]
```

<!-- 2 types of methods
1. Query - asking for something, we get it returned back
2. Command - A method performs an action (often changes something else)
-->