

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


    # STUDENT.SONGS shows songs 
    # RECOMMENDATION.SONG shows individual song related to that recommendation

end