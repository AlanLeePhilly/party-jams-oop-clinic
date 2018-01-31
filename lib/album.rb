require 'pry'
class Album
  attr_reader :id, :album_name, :artists, :tracks
  def initialize(id, album_name, artists)
    @id = id
    @album_name = album_name
    @artists = artists
    @tracks = []
  end

  def duration
    result = 0
    @tracks.each do |track|
      result += track.duration
    end
    seconds = result/1000
    result = Time.at(seconds).utc.strftime("%H:%M:%S")
    return result
  end

  def track_list
    result = ""
    @tracks.each do |track|
      result += track.titleize
    end
    return result
  end

  def summary
    "\nAlbum: #{album_name}\nArtist: #{artists}\nDuration: #{duration}\nTracks:\n#{track_list}"

  end
end
