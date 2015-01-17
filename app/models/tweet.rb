module Tweet

  TCLIENT = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["CONSUMER_KEY"]
    config.consumer_secret     = ENV["CONSUMER_SECRET"]
    config.access_token        = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  end

  def self.twitter_search(string)
    result = TCLIENT.search(string, result_type: "popular").max_by { |tweet| tweet.retweet_count }
    if result
      result.id
    else
      nil
    end
  end

end
