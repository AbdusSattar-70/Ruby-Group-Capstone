require_relative './music_album'
require_relative './genre'
require 'json'

class ListMusicAndGenre
  attr_accessor :albums

  def initialize(filename: './data/albums.json')
    @filename = filename
    @albums = load_data || []
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

    genre = Genre.new(genre_input)
    music_album = MusicAlbum.new(name, publish_date, genre, on_spotify)
    genre.add_item(music_album)

    @albums << music_album
    display_message("The album '#{music_album.name}' was successfully added to the list.")
    save_data
  end

  def display_message(message)
    puts '=' * message.length
    puts message
    puts '=' * message.length
  end

  def list_music_album
    if @albums.empty?
      puts '******* No music albums found! *********'
    else
      puts '----------- MUSIC ALBUMS -----------'
      @albums.each do |music_album|
        puts "Name: #{music_album.name}"
        puts "Genre: #{music_album.genre.name}"
        puts "Release Date: #{music_album.publish_date}"
        puts "On Spotify: #{music_album.on_spotify}"
      end
    end
  end

  def list_genre
    genres = @albums.map(&:genre).uniq
    if genres.empty?
      puts '********* No genres found! **********'
    else
      puts '----------- GENRES -----------'
      genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
  end

  def load_data
    if File.exist?(@filename)
      data = JSON.parse(File.read(@filename))
      data.map do |album_data|
        genre = Genre.new(album_data['genre']['name'], id: album_data['genre']['id'])

        MusicAlbum.new(album_data['name'], album_data['publish_date'], genre, album_data['on_spotify'])
      end
    else
      []
    end
  end

  def save_data
    albums_json = @albums.map do |album|
      genre_data = album.genre.is_a?(Genre) ? { id: album.genre.id, name: album.genre.name } : album.genre
      {
        name: album.name,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: genre_data
      }
    end

    File.write(@filename, albums_json.to_json)
  end
end
