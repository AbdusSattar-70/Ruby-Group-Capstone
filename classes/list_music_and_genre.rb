require_relative './music_album'
require_relative './genre'

class ListMusicAndGenre
  attr_accessor :music_album, :genre

  def initialize
    @music_album = []
    @genre = []
  end

  def create_music_album
    display_message('What name should we call the album? ')
    name = gets.chomp
    display_message('What genre is the album? ')
    genre_input = gets.chomp
    display_message('What is the release date of the album?(YY-MM-DD) ')
    publish_date = gets.chomp
    display_message('Is the album on Spotify? (y/n)? ')
    on_spotify = gets.chomp.downcase

    music_album = MusicAlbum.new(name, publish_date, genre, on_spotify)
    genre = Genre.new(genre_input, id: Random.rand(1..1000))
    genre.add_item(music_album)

    @music_album << music_album
    display_message("The album '#{music_album.name}' was successfully added to the list.")
  end

  def display_message(message)
    puts '=' * message.length
    puts message
    puts '=' * message.length
  end

  def list_music_album
    if @music_album.empty?
      puts '******* No music albums found! *********'
    else
      puts '----------- MUSIC ALBUMS -----------'
      @music_album.each do |music_album|
        puts "Name: #{music_album.name}"
        puts "Genre: #{music_album.genre.name}"
        puts "Release Date: #{music_album.publish_date}"
        puts "On Spotify: #{music_album.on_spotify}"
      end
    end
  end

  def list_genre
    genres = @music_album.map(&:genre).uniq
    if genres.empty?
      puts '********* No genres found! **********'
    else
      puts '----------- GENRES -----------'
      genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
  end
end
