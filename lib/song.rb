require 'rest-client'
require 'json'
require 'pry'

#Musix Match api url
$base_url = "https://api.musixmatch.com/ws/1.1/"
#API Key
$api_key = "&apikey=6778947b4e2410f9a74542888456f8b4"

#api method
$lyrics_matcher = "matcher.lyrics.get"

#format url
$format_url = "?format=json&callback=callback"

#Search parameters 
$artist_search_parameter = "&q_artist="
$track_search_parameter = "&q_track="


class Song < ActiveRecord::Base
    has_many :recommendations
    has_many :students, through: :recommendations
    

    DECADES = {
        "1810's": 1810,
        "1820's": 1820, 
        "1830's": 1830, 
        "1840's": 1840, 
        "1850's": 1850, 
        "1860's": 1860, 
        "1870's": 1870, 
        "1880's": 1880, 
        "1890's": 1890, 
        "10's": 1910,
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
        arr = Song.all.map do |song|
            "#{song.name} - #{song.artist}\n"
        end
        arr = arr.sort { |a, b| a <=> b }
        arr.each do |song|
            puts song
        end
    end


    def self.song_viewer
        self.playlist
        puts "Enter a song name and see who recommended it: "
        song_name = gets.chomp
        song = Song.find_by(name: song_name)
        if song 
            puts "#{song.name} by #{song.artist} was recommended by #{song.students.first.name}"
        else 
            puts "Sorry we don't have a record of that song"
        end
    end

    def self.favorite_decade(student)
        favorite_decade = ''
        student_obj = Student.find_by(name: student)
        students_songs = student_obj.songs
        if students_songs.size >=1
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
        else 
            puts "Sorry #{student} doesn't have any recommendations yet..."
        end
    end

    def Song.average_rating(song_name)
        song = Song.find_by(name: song_name)
        s_id = song.id
        song_rating = Rating.all.select do |rate|
            rate.song_id == s_id
       end
       sum = song_rating.map.sum do |s_instance|
        s_instance.ratings.to_f
       end
       average = sum / song_rating.count
       p average.round(2)
    end

    def self.list_genres 
        genres = Song.all.map do |song|
            song.genre
        end
        genres.uniq.each do |genre|
            puts "#{genre}"
        end
    end

    def self.search_lyrics
        puts 'What is the song name?'
        track_name = gets.chomp
        puts 'What is the artist name?'
        artist_name = gets.chomp
        call = $base_url + $lyrics_matcher + $format_url + $track_search_parameter + track_name + $artist_search_parameter  + artist_name + $api_key
        response = RestClient.get(call)
        response_hash = JSON.parse(response.body)
        if ( response_hash['message']['header']['status_code'] != 200 )
            puts "We could not find your song..."
        else 
            puts lyrics = response_hash["message"]["body"]["lyrics"]["lyrics_body"]
        end
    end
    

end


