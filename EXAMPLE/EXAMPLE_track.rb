class Track
  attr_reader :id, :title, :duration, :track_number
  def initialize(id, title, duration, number)
    @id = id
    @title = title
    @duration = duration
    @track_number = number
  end

  def titleize
    "#{@track_number}) #{title}\n"
  end
end
