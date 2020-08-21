require_relative '../config/environment'
ActiveRecord::Base.logger = nil
$prompt = TTY::Prompt.new
$pastel = Pastel.new
$font = TTY::Font.new(:standard)

def greeting
    player = RubyAfplay::Player.new("/Users/jpark/Flatiron/saturday-jam.mp3", volume: 0.2, time: 5.8, rate: 1.5)
    player.play
    puts `clear`
    puts $pastel.bright_red($font.write("Welcome to")) 
    sleep 0.5
   puts $pastel.bright_magenta($font.write("Flatiron Chicago"))
   sleep 0.5
   puts $pastel.yellow($font.write("08032020 Cohort's"))
   sleep 0.5
   puts $pastel.bright_green($font.write("Playlist!!!"))
end

def login_or_signup
    puts "Log in with first name or enter your first name to create an account: "
    username = gets.chomp
    $student = Student.find_or_create_by(name: username)
    puts `clear`
    p "Welcome #{$student.name}!"
    #Add option when creating a new user to input favorite genre, age, etc.
end


def main_menu
    sleep 2
    puts `clear`
    input = $prompt.select("What would you like to do, #{$student.name}? ") do |menu|
        menu.choice 'My profile'
        menu.choice 'View playlist'
        menu.choice 'Edit playlist'
        menu.choice 'Search'
        menu.choice 'Exit'
    end

    case input 
    when "My profile"
        sleep 2
        puts `clear`
        user_profile
    when "View playlist"
        sleep 2
        puts `clear`
        rating
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
        puts `clear`
        player = RubyAfplay::Player.new("/Users/jpark/Flatiron/saturday-jam.mp3", volume: 0.2, time: 5.8, rate: 1.5)
        player.play
        puts $pastel.bright_cyan($font.write("Thank you for"))
        puts $pastel.bright_blue($font.write("using our app!"))
    end 
end

def edit_menu
    sleep 1
    input = $prompt.select("") do |menu|
        menu.choice 'Add song to playlist'
        menu.choice 'Edit song'
        menu.choice 'Delete song'
        menu.choice 'Main menu'
    end
    
    case input 
    when "Add song to playlist"
        sleep 2
        puts `clear`
        puts 'Enter the name of the song you would like to recommend: '
        name = gets.chomp
        puts 'Enter the artist: '
        artist = gets.chomp
        puts 'Enter the genre: '
        genre = gets.chomp
        puts 'Enter release year: '
        year = gets.chomp.to_i
        $student.recommend_song(name, artist, genre, year)
        edit_menu
    when "Edit song"
        sleep 2
        puts `clear`
        my_songs = $student.songs 
        if my_songs.size >= 1
            $student.print_songs
            puts 'Enter the name of the song you would like to edit: '
            song = gets.chomp
            puts 'Enter the artist: '
            artist = gets.chomp
            $student.edit_recommendation(song, artist)
        else
            p 'You have no song recommendations!!!'
        end
        edit_menu
    when "Delete song"
        puts `clear`
        sleep 2
        my_songs = $student.songs 
        if my_songs.size >= 1
            $student.print_songs
            puts 'Enter the name of the song you would like to delete: '
            song = gets.chomp
            puts 'Enter the artist: '
            artist = gets.chomp
            $student.delete_recommendation(song, artist)
        else
            p 'You have no song recommendations!!!'
        end
        edit_menu

    when "Main menu"
        main_menu
    end

end

def search_menu
    sleep 1
    input = $prompt.select("") do |menu|
        menu.choice "Search for song lyrics"
        menu.choice 'Who recommended this song?'
        menu.choice 'View songs by Genre'
        menu.choice "What's your friend's favorite decade?"
        menu.choice "Your friend's recommendations"
        menu.choice 'Main menu'
    end

    case input 
    when "Search for song lyrics"
        sleep 1.5
        puts `clear`
        Song.search_lyrics
        search_menu
    when 'Who recommended this song?'
        sleep 2 
        puts `clear`
        Song.song_viewer
        sleep 2
        search_menu
    when "View songs by Genre"
        sleep 2
        puts `clear`
        Song.list_genres
        puts "Choose genre: "
        input = gets.chomp
        $student.view_songs_by_genre(input)
        sleep 2
        search_menu
    when "What's your friend's favorite decade?"
        sleep 2
        puts `clear`
        Student.list_students
        puts "Who's favorite decade would you like to view?"
        input = gets.chomp
        puts `clear`
        Song.favorite_decade(input)
        search_menu
    when "Your friend's recommendations"
        sleep 2
        puts `clear`
        Student.list_students
        puts "Who's recommendations would you like to see?"
        name = gets.chomp
        puts `clear`
        Student.student_recommendations(name)
        sleep 1.5
        search_menu
    when "Main menu"
        main_menu
    end

end

def user_profile
    $student.view_profile($student.name)
    input = $prompt.select("") do |menu|
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

def rating
    Song.playlist
    sleep 1
    input = $prompt.select("Would you like to rate a song? ") do |menu|
        menu.choice 'Yes'
        menu.choice "No"
    end
    case input
    when "Yes"
    sleep 1
    puts 'Enter the name of the song you would like to rate: '
    name = gets.chomp
    rate = $prompt.slider("Select your rating", max: 10, step: 1, default: 5)
    $student.rate_song(name, rate)
        sleep 1
        input = $prompt.select("Would you like to view the average rating of this song? ") do |menu|
            menu.choice 'Yes'
            menu.choice "No"
        end
        case input
        when "Yes"
        sleep 1
        puts "Average rating: "
        Song.average_rating(name)
        when "No"
        sleep 1
        main_menu
        end
    when "No"
    sleep 1
    main_menu
    end
end

def next_action
    sleep 2
    input = $prompt.select("What would you like to do, #{$student.name}? ") do |menu|
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
        puts `clear`
        player = RubyAfplay::Player.new("/Users/jpark/Flatiron/saturday-jam.mp3", volume: 0.2, time: 5.8, rate: 1.5)
        player.play
        puts $pastel.bright_cyan($font.write("Thank you for"))
        puts $pastel.bright_blue($font.write("using our app!"))
    end
end

#creaters: Charlie Patron and JoAnna Park
#Flatiron Mod-1 Ruby Project
