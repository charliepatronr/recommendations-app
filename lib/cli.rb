require_relative '../config/environment'
ActiveRecord::Base.logger = nil
$prompt = TTY::Prompt.new
$pastel = Pastel.new
$font = TTY::Font.new(:standard)

def greeting
    puts $pastel.bright_red($font.write("Welcome to")) 
    sleep 1
   puts $pastel.bright_magenta($font.write("Flatiron Chicago"))
   sleep 1
   puts $pastel.yellow($font.write("08032020 Cohort's"))
   sleep 1
   puts $pastel.bright_green($font.write("Playlist!!!"))
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

    # prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
# =>
# Choose your destiny? (Use arrow keys, press Enter to select)
# ‣ Scorpion
#   Kano
#   Jax

# user_input = prompt.select("Select an action?", choices)
# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))

def main_menu
    sleep 2
    puts `clear`
    input = $prompt.select("What would you like to do? ") do |menu|
        menu.choice 'View your profile'
        menu.choice 'View playlist'
        menu.choice 'Edit playlist'
        menu.choice 'Search'
        menu.choice 'Exit'
    end

    case input 
    when "View your profile"
        sleep 2
        puts `clear`
        user_profile
    when "View playlist"
        sleep 2
        puts `clear`
        Song.playlist
        next_action
    when "Edit playlist"
        sleep 2
        puts `clear`
        edit_menu
    when "Search"
        sleep 2
        puts `clear`
        search_menu
    when "Exit"
        sleep 1
        puts $pastel.bright_cyan($font.write("Thank you for"))
        puts $pastel.bright_blue($font.write("using our app!"))
    end 
end

def edit_menu
    sleep 2
    puts `clear`
    input = $prompt.select("What would you like to do? ") do |menu|
        menu.choice 'Add a song to playlist'
        menu.choice 'Edit your songs'
        menu.choice 'Delete your songs'
        menu.choice 'Return to main menu'
    end
    
    case input 
    when "Add a song to playlist"
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
    when "Edit your songs"
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
    when "Delete your songs"
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

    when "Return to main menu"
        main_menu
    end

end

def search_menu
    sleep 2
    puts `clear`
    input = $prompt.select("What would you like to do? ") do |menu|
        menu.choice 'View songs by Genre'
        menu.choice "Your friend's favorite decade"
        menu.choice "Your friend's recommendations"
        menu.choice 'Return to main menu'
    end

    case input 
    when "View songs by Genre"
        sleep 2
        puts `clear`
        puts "Choose genre: "
        Song.list_genres
        input = gets.chomp
        $student.view_songs_by_genre(input)
        sleep 2
        search_menu
    when "Your friend's favorite decade"
        sleep 2
        puts `clear`
        puts "Who's favorite decade would you like to view? :"
        # different message if student dont have any recommendations
        Student.list_students
        input = gets.chomp
        Song.favorite_decade(input)
        search_menu
    when "Your friend's recommendations"
        sleep 2
        puts `clear`
        puts 'Enter student name: '
        name = gets.chomp
        Student.student_recommendations(name)
        search_menu
    when "Return to main menu"
        main_menu
    end

end

def user_profile
    $student.view_profile($student.name)
    input = $prompt.select("What would you like to do? ") do |menu|
        menu.choice 'View your recommendations'
        menu.choice 'Return to main menu'
    end
    case input 
    when "View your recommendations"
        sleep 2
        puts `clear`
        Student.student_recommendations($student.name)
        sleep 2
        input = $prompt.select("What would you like to do? ") do |menu|
            menu.choice 'Go back to view profile'
            menu.choice 'Return to main menu'
        end
        case input
        when 'Go back to view profile'
            sleep 2
            puts `clear`
            user_profile
        when 'Return to main menu'
            main_menu
        end
    when "Return to main menu"
        sleep 2
        puts `clear`
        main_menu
    end
end

def next_action
    sleep 2
    input = $prompt.select("What would you like to do? ") do |menu|
        menu.choice 'Return to main menu'
        menu.choice "Exit"
    end

    case input 
    when "Return to main menu"
        sleep 2
        puts `clear`
        main_menu
    when "Exit"
        sleep 1
        puts $pastel.bright_cyan($font.write("Thank you for"))
        puts $pastel.bright_blue($font.write("using our app!"))
    end
end


