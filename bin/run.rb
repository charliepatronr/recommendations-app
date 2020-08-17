require_relative '../config/environment'

puts "hello world"

class CommandLineInterface
    def greet
        puts 'Welcome to Felp, the best resource for restaurant information in the world!'
    end
end

cli = CommandLineInterface.new
cli.greet

puts "Thinking of eating somewhere but not sure if it's good? We can help you with that decision!"
puts "Enter a student name to get started:"
student_name = gets.chomp
student = Student.find_by(name: student_name)

# student = Student.find(student_name)
p student

