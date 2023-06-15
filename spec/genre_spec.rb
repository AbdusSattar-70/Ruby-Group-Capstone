require_relative '../classes/genre'
require_relative '../classes/music_album'

RSpec.describe Genre do
  before :each do
    @genre = Genre.new('Afrobeat')
    @music_album = MusicAlbum.new('Afropop', '1990-06-03', @genre, on_spotify: true)
  end

  it 'is an instance of the Genre class' do
    expect(@genre).to be_instance_of(Genre)
  end

  it 'has a name attribute' do
    expect(@genre.name).to eq('Afrobeat')
  end

  it 'has an empty items collection' do
    expect(@genre.items).to eq([])
  end

  it 'adds itself as the item\'s genre' do
    @genre.add_item(@music_album)
    expect(@music_album.genre).to eq(@genre)
  end
end
