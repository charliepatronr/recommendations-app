

class Song < ActiveRecord::Base
    has_many :recommendations
    has_many :students, through: :recommendations
    

    DECADES = {
        "20's": 1920, 
        "30's": 1930, 
        "40's": 1940, 
        "50's": 1950, 
        "60's": 1960, 
        "70's": 1970, 
        "80's": 1980, 
        "90's": 1990, 
        "2000's": 2000, 
        "2010's": 2010
    }
    def self.playlist
        Song.all.map do |song|
        puts "#{song.name} - #{song.artist}\n"
        end
    end


    def self.song_viewer(song_name)
        song = Song.find_by(name: song_name)
        puts "#{song.name} by #{song.artist} was recommended by #{song.students.first.name}"
    end

    def self.favorite_decade(student)
        favorite_decade = ''
        student_obj = Student.find_by(name: student)
        students_songs = student_obj.songs
        song_sum = students_songs.sum do |song|
            song.year
        end
        average = song_sum.to_f / students_songs.size
        DECADES.each do |key, value|
            if (average >= value)
                favorite_decade = key
            end
        end
        puts "#{student_obj.name}'s favorite decade is #{favorite_decade}"
    end

end