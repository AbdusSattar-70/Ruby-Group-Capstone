require_relative '../classes/list_music_and_genre'
require 'date'

RSpec.describe ListMusicAndGenre do
  before do
    @music_app = ListMusicAndGenre.new
  end

  it 'is an instance of the class' do
    expect(@music_app).to be_instance_of(ListMusicAndGenre)
  end

  describe '#create_music_album' do
    before do
      allow(@music_app).to receive(:gets).and_return(
        'Test Album',
        '2023-03-23',
        'rock',
        'y'
      )
    end

    it 'adds the correct album to the albums list' do
      @music_app.create_music_album
      album = @music_app.albums.last
      expect(album.name).to eq('Test Album')
      expect(album.publish_date).to eq('rock')
      expect(album.genre.name).to eq('2023-03-23')
      expect(album.on_spotify).to eq('y')
    end
  end
end
