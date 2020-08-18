require_relative '../config/environment'

puts "hello world"

class CommandLineInterface
    def edit_recommendation
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


Student.login("JoAnna Park")

case input
when "1"
    puts 'Profile page'
when '2'
    puts 'Visits Page'
when '3'
    puts ''
when '4'
    puts 'Remove visit'
end