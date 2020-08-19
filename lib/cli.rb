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
    puts `clear`
    p "Welcome #{$student.name}!"
    #Add option when creating a new user to input favorite genre, age, etc.
end

    #Add view profile method


def main_menu
    sleep 2
    puts <<~TEXT
    Would you like to: 
    1. View playlist
    2. Edit playlist
    3. Search
    4. Exit
    TEXT
    input = gets.chomp

    case input 
    when "1"
        sleep 2
        puts `clear`
        Song.playlist
        next_action
    when "2"
        sleep 2
        puts `clear`
        edit_menu
    when "3"
        sleep 2
        puts `clear`
        search_menu
    when "4"
        puts 'Thank you for using our App!'
    end 
end

def edit_menu
    sleep 2
    puts `clear`
    puts <<~TEXT
    Would you like to: 
    1. Add a song to playlist
    2. Edit your songs
    3. Delete your songs
    4. Return to main menu
    TEXT
    input = gets.chomp
    
    case input 
    when "1"
        sleep 2
        puts `clear`
        puts 'Enter the name of the song you would like to recommend: '
        name = gets.chomp
        puts 'Enter the artist of the song you would like to recommend: '
        artist = gets.chomp
        puts 'Enter the genre of the song you would like to recommend: '
        genre = gets.chomp
        puts 'Enter the year of the song you would like to recommend: '
        year = gets.chomp.to_i
        $student.recommend_song(name, artist, genre, year)
        edit_menu
    when "2"
        sleep 2
        puts `clear`
        my_songs = $student.songs 
        if my_songs.size >= 1
            $student.print_songs
            puts 'Enter the name of the song you would like to edit: '
            song = gets.chomp
            puts 'Enter the artist of the song you would like to edit: '
            artist = gets.chomp
            $student.edit_recommendation(song, artist)
        else
            p 'You have no song recommendations!!!'
        end
        edit_menu
    when "3"
        puts `clear`
        sleep 2
        my_songs = $student.songs 
        if my_songs.size >= 1
            $student.print_songs
            puts 'Enter the name of the song you would like to delete: '
            song = gets.chomp
            puts 'Enter the artist of the song you would like to delete: '
            artist = gets.chomp
            $student.delete_recommendation(song, artist)
        else
            p 'You have no song recommendations!!!'
        end
        edit_menu

    when "4"
        main_menu
    end

end

def search_menu
    sleep 2
    puts `clear`
    puts <<~TEXT
    Would you like to: 
    1. View songs by Genre
    2. Your friend's favorite decade
    3. Your friend's recommendations
    4. Return to main menu
    TEXT
    input = gets.chomp
    case input 
    when "1"
        sleep 2
        puts `clear`
        puts "Choose genre: "
        Song.list_genres
        input = gets.chomp
        $student.view_songs_by_genre(input)
        sleep 2
        search_menu
    when "2"
        sleep 2
        puts `clear`
        puts "Who's favorite decade would you like to view? :"
        # different message if student dont have any recommendations
        Student.list_students
        input = gets.chomp
        Song.favorite_decade(input)
        search_menu
    when "3"
        sleep 2
        puts `clear`
        puts 'Enter student name: '
        name = gets.chomp
        Student.student_recommendations(name)
        search_menu
    when "4"
        main_menu
    end

end

def next_action
    sleep 2
    puts <<~TEXT
    Would you like to: 
    1. Return to main menu
    2. Exit
    TEXT
    input = gets.chomp
    case input 
    when "1"
        sleep 2
        puts `clear`
        main_menu
    when "2"
        sleep 2
        puts 'Thank you for using our App!'
    end
end


