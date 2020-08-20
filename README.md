Flatiron Chicago 08032020 Cohort's Playlist
========================
Flatiron Chicago 08023030 Cohort's Playlist is a CLI application used to view a playlist which consists of the cohort's favorite songs and to add songs to the playlist.

## Instructions

1. open your terminal
2. git clone https://github.com/charliepatronr/recommendations-app.git
3. cd recommendations-app
4. bundle install
5. type ruby bin/run.rb
6. use app


## Domain Model

Students -< Recommendations >- Songs


## User Stories 
User will be able to:

- Add songs to playlist (create)
- View user profile (read)
- View recommendations made by user (read)
- View all songs in playlist (read)
- Rate a song (create)
- View average rating of song (read)
- Edit songs in playlist (update)
- Delete songs in playlist (delete)
- Search for song lyrics (read)
- View songs by genre (read)
- View a student's favorite decade (read)
- View a student's song recommendations (read)


### Tables 

Student
- name (str)
- age (int)
- favorite_genre (str)

Recommendation
- user_id (int)
- song_id (int)
- timestamps 

Song 
- name(str) 
- artist (str)
- year (int)
- genre (int)

Rating
- song_id (int)
- ratings (int)
- timestamps


## Creators
- Charlie Patron
- JoAnna Park