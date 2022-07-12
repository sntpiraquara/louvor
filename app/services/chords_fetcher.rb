class ChordsFetcher
  attr_reader :artist, :title, :chords

  def initialize(artist, title)
    @artist = artist
    @title = title
  end

  def run
    artist_slug = first_artist_match

    chords = fetch_chords(artist_slug, @title.parameterize)

    unless chords
      song_slug = first_song_match(artist_slug)
      chords = fetch_chords(artist_slug, song_slug)
    end

    @chords = chords
  end

  private

  def first_artist_match
    conn = Faraday.new(
      url: 'https://studiosolsolr-a.akamaihd.net',
      params: {
        q: @artist
      }
    )

    response = conn.get('/cc/h2/')

    return false if response.status != 200

    json = JSON.parse(response.body[1...-2])

    json['response']['docs'][0]['d']
  end

  def fetch_chords(artist_slug, song_slug)
    conn = Faraday.new(
      url: 'https://www.cifraclub.com.br/'
    )

    response = conn.get("#{artist_slug}/#{song_slug}/imprimir.html")

    return false if response.status != 200

    parser = Nokogiri::HTML.parse(response.body)
    parser.search('pre').text
  end

  def first_song_match(artist_slug)
    song_title = @title.parameterize

    conn = Faraday.new(
      url: 'https://studiosolsolr-a.akamaihd.net',
      params: {
        q: "#{artist_slug} #{song_title}"
      }
    )

    response = conn.get('/cc/h2/')

    return false if response.status != 200

    json = JSON.parse(response.body[1...-2])

    json['response']['docs'][0]['u']
  end
end
