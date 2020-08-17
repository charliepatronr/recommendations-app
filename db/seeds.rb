Song.destroy_all
Student.destroy_all
Recommendation.destroy_all


10.times do
    Song.create(
        name: Faker::Music::Prince.song,
        artist: Faker::Music.band,
        genre: Faker::Music.genre,
        year: Faker::Number.number(digits: 4)
    )
end



10.times do
    Student.create(
        name: Faker::Name.name,
        age: Faker::Number.number(digits: 2),
        favorite_genre: Faker::Music.genre
    )
end 


10.times do
    Recommendation.create(
        student_id: Student.ids.sample,
        song_id: Song.ids.sample
    )
end