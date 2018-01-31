require 'spec_helper'
require 'pry'

RSpec.describe Album do
  describe '.new' do
    it 'takes an id, name, and name of artists' do
      new_album = Album.new("2dasdD12dASfwR3F", "Yeezus", "Kanye West")
      expect(new_album).to be_a(Album)
    end
  end

  let(:tracks)  {
    [
      {
        :album_id=>"6aSk2vxoY3xtz7cXKuY9EL",
        :track_id=>"2BOUrjXoRIo2YHVAyZyXVX",
        :title=>"Yeah - Crass Version",
        :track_number=>14,
        :duration_ms=>561253,
        :album_name=>"London Sessions",
        :artists=>"LCD Soundsystem"
      },
      {
        :album_id=>"6aSk2vxoY3xtz7cXKuY9EL",
        :track_id=>"4lL35nfQSgSvDsVFQtJ4Wp",
        :title=>"Yr City's A Sucker",
        :track_number=>16,
        :duration_ms=>562160,
        :album_name=>"London Sessions",
        :artists=>"LCD Soundsystem"
      }
    ]
  }
  let(:new_album) { Album.new(tracks[0][:album_id], tracks[0][:album_name], tracks[0][:artists]) }

  describe '#id' do
    it 'has a reader for the album id' do
      expect(new_album.id).to eq("6aSk2vxoY3xtz7cXKuY9EL")
    end
  end

  describe '#album_name' do
    it 'has a reader for the album name' do
      expect(new_album.album_name).to eq("London Sessions")
    end
  end

  describe '#artists' do
    it 'has a reader for the artists' do
      expect(new_album.artists).to eq("LCD Soundsystem")
    end
  end

  describe '#tracks' do
    it 'has a reader for the track array' do
      expect(new_album.tracks).to eq([])
    end
  end

  describe '#duration' do
    it 'calculates the duration of the album in hh:mm:ss' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:duration_ms], track[:track_number])
      end
      expect(new_album.duration).to eq("00:18:43")
    end
  end

  describe '#track_list' do
    it 'displays each track in a readable string' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:duration_ms], track[:track_number])
      end

      expect(new_album.track_list).to eq("14) Yeah - Crass Version\n16) Yr City's A Sucker\n")
    end
  end

  describe '#summary' do
    it 'lists out all tracks in an album' do
      albums = []
      tracks.each do |track|
        album = albums.find { |a| a.id == track[:album_id] }
        if album.nil?
          albums << new_album
        end
        new_album.tracks << Track.new(track[:track_id], track[:title], track[:duration_ms], track[:track_number])
      end
      expect(new_album.summary).to eq("\nAlbum: London Sessions\nArtist: LCD Soundsystem\nDuration: 00:18:43\nTracks:\n14) Yeah - Crass Version\n16) Yr City's A Sucker\n")
    end
  end
end
