require_relative '../config/environment'
ActiveRecord::Base.logger = nil

# Student.login("JoAnna Park")

def greeting
    puts "Welcome to Flatiron Chicago 08032020 Cohort's Playlist!"
end

def login_or_signup
    puts "Please log in with your username or enter new username to create an account: "
    username = gets.chomp
    $student = Student.find_or_create_by(name: username)
    p "Welcome #{$student.name}!"
end

def menu
    puts <<~TEXT
    "What would you like to do next?"
    "1. Recommend a song"
    "2. View Songs in Playlist"
    "3. Edit recommendation"
    "4. Delete recommendation"
    "5. View Recommendation by Student name"
    TEXT

    print "Enter your selection: "
    input = gets.chomp

    case input
        when "1"
            puts 'Enter the name of the song you would like to recommend: '
            name = gets.chomp
            puts 'Enter the artist of the song you would like to recommend: '
            artist = gets.chomp
            puts 'Enter the genre of the song you would like to recommend: '
            genre = gets.chomp
            puts 'Enter the year of the song you would like to recommend: '
            year = gets.chomp.to_i
            $student.recommend_song(name, artist, genre, year)

        when '2'
        Song.playlist

        when '3'
            my_songs = $student.songs 
            if my_songs.size >= 1
                p my_songs
                puts 'Enter the name of the song you would like to edit: '
                song = gets.chomp
                puts 'Enter the artist of the song you would like to edit: '
                artist = gets.chomp
                $student.edit_recommendation(song, artist)
            else
                p 'You have no song recommendations!!!'
            end
        when '4'
            my_songs = $student.songs 
            if my_songs.size >= 1
                p my_songs
                puts 'Enter the name of the song you would like to delete: '
                song = gets.chomp
                puts 'Enter the artist of the song you would like to delete: '
                artist = gets.chomp
                $student.delete_recommendation(song, artist)
            else
                p 'You have no song recommendations!!!'
            end
        when '5'
            puts 'Enter student name: '
            name = gets.chomp
            p Student.student_recommendations(name)
    end

end

