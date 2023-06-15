require_relative '../classes/item'
require_relative '../classes/music_album'

describe MusicAlbum do
  before do
    @music_album = MusicAlbum.new('Afropop', '2020-03-23', 'pop', true)
  end

  describe '#initialize' do
    it 'should return a MusicAlbum object' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end
  end

  describe 'it has 4 attributes' do
    it 'should return the attributes' do
      expect(@music_album).to have_attributes(name: 'Afropop', publish_date: '2020-03-23', genre: 'pop',
                                              on_spotify: true)
    end
  end
end
