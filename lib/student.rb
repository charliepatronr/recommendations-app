$prompt = TTY::Prompt.new


class Student < ActiveRecord::Base
    has_many :recommendations
    has_many :songs, through: :recommendations


    def recommend_song(name, artist, genre, year)
        if (!Song.exists?(:name => name, :artist => artist))
            song = Song.create(name: name, genre: genre, year: year, artist: artist)
            self.songs << song
        else 
            puts 'Hey song already exists! Enter a different song'
        end
        p 'Thanks for your recommendation!'
    end

    def edit_recommendation(name, artist)
        song = Song.find_by(name: name, artist: artist)
        song_id = song.id

        #I used TTYprompt to redo this selection menu!

        input = $prompt.select("What would you like to update? ") do |menu|
            menu.choice 'Song name'
            menu.choice 'Artist'
            menu.choice 'Genre'
            menu.choice 'Year'
        end

        case input 
        when 'Song name'
            puts "Enter new song name"
            replace = gets.chomp
            Song.update(song_id, name: replace )
        when 'Artist'
            puts "Enter new song artist"
            replace = gets.chomp
            Song.update(song_id, name: replace )
        when 'Genre'
            puts "Enter new genre"
            replace = gets.chomp
            Song.update(song_id, name: replace )
        when 'Year'
            puts "Enter new year"
            replace = gets.chomp
            Song.update(song_id, name: replace )
        end
        p 'Your recommendation has been updated!'
    end

    def delete_recommendation(song_name, artist)
        song = Song.find_by(name: song_name, artist: artist)
        song_id = song.id
        recommendation = Recommendation.find_by(song_id: song_id)
        song.destroy
        recommendation.destroy
        p 'Your recommendation has been deleted!'
    end

    def self.student_recommendations(student_name)
        target = Student.find_by(name: student_name)
            songs_ids = target.recommendations.map do |recommend|
            recommend.song_id
        end 
        songs_array = songs_ids.map do |id|
            Song.find(id)
        end
        songs_array.each do |song|
            puts "#{song.name} - #{song.artist}\n"
        end
    end

    def view_songs_by_genre(song_genre)
        array = Song.all.select do |song|
            song.genre == song_genre
        end
        array.each do |song|
            puts "#{song.name} - #{song.artist}\n"
        end
    end

    def view_profile(name)
       array = Student.all.select do |student|
            student.name == name
       end
       array.each do |student|
            puts "Name: #{student.name}\nAge: #{student.age}\nFavorite genre: #{student.favorite_genre}"
       end
    end

    def self.list_students
        students = Student.all.map do |student|
            student.name
        end
        students.each do |student|
            puts "#{student}"
        end
    end

    def print_songs
        self.songs.each do |song|
            puts "#{song.name} - #{song.artist}\n"
        end
    end
    # my_songs = $student.songs 

    # STUDENT.SONGS shows songs 
    # RECOMMENDATION.SONG shows individual song related to that recommendation

end