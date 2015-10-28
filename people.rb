

class Person
	attr_accessor :name
		def greeting
			puts "Hi, my name is #{name}"
		end
end


class Student < Person
	def learn
		puts "I get it!"
	end
end


class Instructor < Person
	def teach
		puts "Everything in Ruby is an object"
	end
end


instructor = Instructor.new
instructor.name = "Chris"
instructor.greeting

student = Student.new
student.name = "Cristina"
student.greeting

instructor.teach
student.learn

# teach is not a method of student but of the instructor

