class LyricsFetcher
  attr_reader :artist, :title, :lyrics

  def initialize(artist, title)
    @artist = artist
    @title = title
  end

  def run
    conn = Faraday.new(
      url: 'https://api.vagalume.com.br',
      params: {
        art: @artist,
        mus: @title,
        apikey: ENV['VAGALUME_API_KEY']
      }
    ) do |f|
      f.response :json
    end

    response = conn.get('/search.php')

    return false unless response.body.key?('mus')

    @lyrics = response.body['mus'][0]['text']
  end
end
