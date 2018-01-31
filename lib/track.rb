require 'pry'
class Track
  attr_reader :id, :title, :duration, :track_number
  def initialize(id, title, duration, track_number)
    @id = id
    @title = title
    @duration = duration
    @track_number = track_number
  end

  def titleize
    "#{@track_number}) #{@title}\n"
  end
end
