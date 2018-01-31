require 'pry'

class Album
  attr_reader :id, :album_name, :artists, :tracks
  
  def initialize(id, name, artist)
    @id = id
    @album_name = name
    @artists = artist
    @tracks = []
  end

  def duration
    dur_ms = 0
    @tracks.each do |track|
      dur_ms += track.duration
    end
    seconds = dur_ms /1000
    Time.at(seconds).utc.strftime("%H:%M:%S")
  end

  def track_list
    result = ""
    @tracks.each do |track|
      result += track.titleize
    end
    result
  end

  def summary
    "\nAlbum: #{@album_name}\nArtist: #{@artists}\nDuration: #{duration}\nTracks:\n#{track_list}"
  end
end
