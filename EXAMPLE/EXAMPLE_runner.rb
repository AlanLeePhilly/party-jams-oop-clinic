# require_relative 'track_data'
# require_relative 'album'
# require_relative 'track'
#
# albums = []
#
# TRACKS.each do |track|
#   unless albums.any? { |album| album.id == track[:album_id] }
#     albums << Album.new(track[:album_id], track[:album_name], track[:artists])
#   end
#   album = albums.find { |album| album.id == track[:album_id] }
#   album.tracks << Track.new(track[:track_id], track[:title], track[:duration_ms], track[:track_number])
# end
#
# albums.each do |album|
#   puts album.summary
# end
