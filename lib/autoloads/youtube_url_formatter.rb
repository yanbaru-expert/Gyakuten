class YoutubeUrlFormatter
  SRC_REGEX = /src\s*=\s*"([^"]*)"/.freeze
  YOUTUBE_ID_REGEX = %r{\A(?:http(?:s)?://)?(?:www\.)?(?:m\.)?(?:youtu\.be/|youtube\.com/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)/))([^?&"'>]+)(&t=.*)?\z}.freeze

  def self.format(url)
    src_match = SRC_REGEX.match(url)
    url = src_match[1] if src_match
    youtube_id_match = YOUTUBE_ID_REGEX.match(url)
    if youtube_id_match
      "https://www.youtube.com/embed/#{youtube_id_match[1]}"
    end
  end
end
