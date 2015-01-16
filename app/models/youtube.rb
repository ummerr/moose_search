module Youtube

    YCLIENT = YouTubeG::Client.new(:dev_key => ENV["YOUTUBE_KEY"])

  def self.youtube_search string
    result = YCLIENT.videos_by(:query => string)
    result.videos.first.media_content.first.url
  end

end
