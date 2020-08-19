Song.destroy_all
Student.destroy_all
Recommendation.destroy_all

Student.create(
    name: "Austin",
    age: 39,
    favorite_genre: "Rock"
)

Student.create(
    name: "Brian",
    age: 34,
    favorite_genre: "Alternative"
)

Student.create(
    name: "Hector",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Alternative"
)

Student.create(
    name: "Charlie",
    age: 25,
    favorite_genre: "Industrial"
)

Student.create(
    name: "Ian",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "House"
)

Student.create(
    name: "Ignas",
    age: 26,
    favorite_genre: "Deathcore"
)

jeff = Student.create(
    name: "Jeff",
    age: 34,
    favorite_genre: "Jazz"
)

jeff.songs << Song.create(
    name: "My One and Only Love",
    artist: "John Coltrane",
    year: 1963,
    genre: "Jazz"
)

jeff.songs << Song.create(
    name: "You're Not Good Enough",
    artist: "Blood Orange",
    year: 2013,
    genre: "Alternative"
)

jeff.songs << Song.create(
    name: "Fool in the Rain",
    artist: "Led Zeppelin",
    year: 1979,
    genre: "Progressive Rock"
)

Student.create(
    name: "JoAnna",
    age: 29,
    favorite_genre: "Classical"
)

Student.create(
    name: "Josue",
    age: 22,
    favorite_genre: "Hip Hop"
)

Student.create(
    name: "Kimberlyn",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Pop Punk"
)

Student.create(
    name: "Marius",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Folk"
)

Student.create(
    name: "Mizzy",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Hip Hop"
)

Student.create(
    name: "Matthew",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "R&B"
)

Student.create(
    name: "Michelle",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "EDM"
)

Student.create(
    name: "Natalia",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Alternative"
)

Student.create(
    name: "Nick",
    age: 35,
    favorite_genre: "Funk"
)

Student.create(
    name: "Percy",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Film Music"
)

Student.create(
    name: "Ramazan",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Dance"
)

Student.create(
    name: "Victor",
    age: Faker::Number.within(range: 21..50),
    favorite_genre: "Reggaeton"
)

Song.create(
    name: "Captain Freeman",
    artist: "Spacehog",
    year: 1998,
    genre: "Alternative"
)

Song.create(
    name: "Place Your Hands",
    artist: "Reef",
    year: 1996,
    genre: "Rock"
)

Song.create(
    name: "Feast",
    artist: "Claire & the Bears",
    year: 2019,
    genre: "Rock"
)

Song.create(
    name: "Istanbul (not Constantinople)",
    artist: "They Might Be Giants",
    year: 1990,
    genre: "Alternative"
)

Song.create(
    name: "Shia LaBeouf",
    artist: "Rob Cantor",
    year: 2012,
    genre: "Comedy"
)

Song.create(
    name: "You're Dead",
    artist: "Norman Tanega",
    year: 1966,
    genre: "Popular"
)

Song.create(
    name: "Under The Bridge",
    artist: "Red Hot Chili Peppers",
    year: 1991,
    genre: "Alternative"
)

Song.create(
    name: "Nights",
    artist: "Franklin Ocean",
    year: 2016,
    genre: "Popular"
)

Song.create(
    name: "Breezeblocks",
    artist: "alt-J",
    year: 2012,
    genre: "Alternative"
)

Song.create(
    name: "The Pot",
    artist: "Tool",
    year: 2006,
    genre: "Progressive Rock"
)

Song.create(
    name: "Holy War",
    artist: "The Art is Murder",
    year: 2015,
    genre: "Deathcore"
)

Song.create(
    name: "Wake Up",
    artist: "Three Days Grace",
    year: 2015,
    genre: "Hard Rock"
)



Song.create(
    name: "Nocturne in C-sharp minor",
    artist: "Frederic Chopin",
    year: 1830,
    genre: "Classical"
)

Song.create(
    name: "Danzon No. 2",
    artist: "Arturo Marquez",
    year: 1994,
    genre: "Classical"
)

Song.create(
    name: "Scheherazade",
    artist: "Nikolai Rimsky-Korsakov",
    year: 1888,
    genre: "Classical"
)

Song.create(
    name: "Express Yourself",
    artist: "N.W.A.",
    year: 1988,
    genre: "Hip Hop"
)

Song.create(
    name: "Vossi Bop",
    artist: "Stormzy",
    year: 2019,
    genre: "Hip Hop"
)

Song.create(
    name: "Labios Rotos",
    artist: "Zoe",
    year: 2011,
    genre: "Rock"
)

Song.create(
    name: "Fur Elise",
    artist: "Ludwig Van Beethoven",
    year: 1810,
    genre: "Classical"
)

Song.create(
    name: "Sugar, We're Going Down",
    artist: "Fall Out Boy",
    year: 2005,
    genre: "Emo"
)

Song.create(
    name: "Dear Maria, Count Me In",
    artist: "All Time Low",
    year: 2007,
    genre: "Pop Punk"
)

Song.create(
    name: "Kacurrela",
    artist: "Poni ft. Altin Sulku",
    year: 2017,
    genre: "Folk"
)

Song.create(
    name: "Cine te crezi?",
    artist: "Cine te crezi?",
    year: 2017,
    genre: "Popular"
)

Song.create(
    name: "Nights",
    artist: "Franklin",
    year: 2016,
    genre: "Popular"
)

Song.create(
    name: "Opa Opa / Treambura Pamporea",
    artist: "Pindu",
    year: 2018,
    genre: "World"
)

Song.create(
    name: "Wap",
    artist: "Cardi B ft. Megan Thee Stallion",
    year: 2020,
    genre: "Hip Hop"
)

Song.create(
    name: "Hot Girl Summer",
    artist: "Megan Thee Stallion",
    year: 2019,
    genre: "Hip Hop"
)

Song.create(
    name: "This Is How We Do It",
    artist: "Montell Jordan",
    year: 1955,
    genre: "Contemporary R&B"
)

Song.create(
    name: "One Sweet Day (Chucky's Remix)",
    artist: "Mariah Carey, Boyz II Men",
    year: 1995,
    genre: "R&B"
)

Song.create(
    name: "Grateful",
    artist: "Mahalia",
    year: 2019,
    genre: "R&B"
)

Song.create(
    name: "I Know Alone",
    artist: "HAIM",
    year: 2020,
    genre: "Alternative"
)

Song.create(
    name: "You Don't Know Me",
    artist: "Caetano Veloso",
    year: 1972,
    genre: "MPB"
)

Song.create(
    name: "Willow",
    artist: "Joan Armatrading",
    year: 1977,
    genre: "Rock"
)

Song.create(
    name: "Help Yourself",
    artist: "Death In Vegas ft. Hope Sandoval",
    year: 2002,
    genre: "Alternative"
)

Song.create(
    name: "Rehab",
    artist: "Amy Whinehouse",
    year: 2006,
    genre: "Contemporary R&B"
)

Song.create(
    name: "What R We Stealing",
    artist: "David Holmes",
    year: 2004,
    genre: "Film"
)

Song.create(
    name: "Nine Ball",
    artist: "Daniel Pemberton",
    year: 2018,
    genre: "Film"
)

Song.create(
    name: "HIGHEST IN THE ROOM",
    artist: "Travis Scott",
    year: 2019,
    genre: "Hip Hop"
)

Song.create(
    name: "I Can't Get You out of My Head",
    artist: "Glimmer of Blooms",
    year: 2014,
    genre: "Popular"
)

Song.create(
    name: "My Life is Going On",
    artist: "Cecilia Krull",
    year: 2017,
    genre: "Dance"
)

Song.create(
    name: "Safaera",
    artist: "Bad Bunny",
    year: 2020,
    genre: "Reggaeton"
)

Song.create(
    name: "Title Theme(from Ocarina of Time)",
    artist: "Koji Kondo",
    year: 1998,
    genre: "Video Game"
)

Song.create(
    name: "It Makes You Forget(itgehane)",
    artist: "Peggy Gou",
    year: 2018,
    genre: "Electronic"
)

# Recommendation.create(
#     student_id:
#     song_id:
# )

10.times do
    Recommendation.create(
        student_id: Student.ids.sample,
        song_id: Song.ids.sample
    )
end