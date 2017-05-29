class Person
attr_reader :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{name}"
  end
end


class Student < Person
  def initialize(name)
    super(name)
  end

  def learn
    puts "I get it!"
  end
end


class Instructor < Person
  def initialize(name)
    super(name)
  end

  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")
cristina = Student.new("Cristina")

chris.greeting
cristina.greeting

chris.teach #works
cristina.learn #works
cristina.teach #method limited to Instructor class
chris.learn #method limited to Student class
