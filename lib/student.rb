

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
    end

    def list_recommendations
        self.recommendations
        # after delete_recommendation method is called both song and recommendations are deleted
        #but recommendation still appears on this method
    end

    # def edit_recommendation(name, artist)
    #     song = Song.find_by(name: name, artist: artist)
    #     song_id = song.id
    #     recommendation = find_by(song_id: song_id)
    #     puts 'Enter what you want to update: '
    #     value_to_update = gets.chomp
    # end

    def delete_recommendation(song_name, artist)
        song = Song.find_by(name: song_name, artist: artist)
        song_id = song.id
        recommendation = Recommendation.find_by(song_id: song_id)
        song.destroy
        recommendation.destroy
        p 'Your recommendation has been deleted'
    end

    def student_recommendations(student_name)
        target = Student.find_by(name: student_name)
        songs_ids = target.recommendations.select do |recommend|
            recommend.song_id
        end 
        song_ids.map do |id|
            Song.find(id)
        end
    end

    def self.login(name)
        student = self.find_or_create_by(name: name)
        p "Welcome #{student.name}!"
    end

    ## IAN 
    # def login2 
    #     user_name = gets.chomp
    #     current_user = Student.find_by(name: user_name)
    # end

    # STUDENT.SONGS shows songs 
    # RECOMMENDATION.SONG shows individual song related to that recommendation
    <<~TEXT
    chunk of text 
    TEXT


end

#name  319
#artist Blinker The Star

