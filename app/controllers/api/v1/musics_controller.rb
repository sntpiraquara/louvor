class Api::V1::MusicsController < ApplicationController
  def fetch_lyrics
    title = params[:music][:title]
    artist = params[:music][:artist]

    service = LyricsFetcher.new(artist, title)

    return render json: {}, status: 404 unless service.run

    render json: {
      lyrics: service.lyrics
    }
  end

  def fetch_chords
    title = params[:music][:title]
    artist = params[:music][:artist]

    service = ChordsFetcher.new(artist, title)

    return render json: {}, status: 404 unless service.run

    render json: {
      chords: service.chords
    }
  end
end
