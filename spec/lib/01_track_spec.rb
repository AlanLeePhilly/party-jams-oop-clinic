require 'spec_helper'

RSpec.describe Track do
  describe '.new' do
    it 'takes an id, title, duration, and track number' do
      new_track = Track.new("2dSgE44GgsdcawR3F", "Bodysnatchers", 33333, 1)
      expect(new_track).to be_a(Track)
    end
  end

  let(:track) {{
    track_id: "2BOUrjXoRIo2YHVAyZyXVX",
    title: "Nicotine & Gravy",
    album_id: "6BOQkxcHspMoRWEwEexf4l",
    album_name: "Midnite Vultures",
    track_number: "5",
    duration_ms: 261741,
    artists: "Beck"
  }}
  let(:new_track) { Track.new(track[:track_id], track[:title], track[:duration_ms], track[:track_number]) }

  describe '#id' do
    it 'has a reader for the track id' do
      expect(new_track.id).to eq("2BOUrjXoRIo2YHVAyZyXVX")
    end
  end

  describe '#title' do
    it 'has a reader for the track title' do
      expect(new_track.title).to eq("Nicotine & Gravy")
    end
  end

  describe '#duration' do
    it 'has a reader for the track duration' do
      expect(new_track.duration).to eq(261741)
    end
  end

  describe '#track_number' do
    it 'has a reader for the track number' do
      expect(new_track.track_number).to eq("5")
    end
  end

  describe '#titleize' do
    it 'makes the track listing look pretty' do
      expect(new_track.titleize).to eq("5) Nicotine & Gravy\n")
    end
  end
end
