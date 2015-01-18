module Tweet

  TCLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["CONSUMER_KEY"]
    config.consumer_secret     = ENV["CONSUMER_SECRET"]
    config.access_token        = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  end

  def self.twitter_search(string)
    # hashed_string = '#' + string
    result = TCLIENT.search(string, result_type: "popular").first
    if result
      result.id.to_s
    else
      result = TCLIENT.search(string).max_by(&:retweet_count)
      if result
        result.id.to_s
      else
        result = TCLIENT.search(string).first
        result.id.to_s
      end
    end
  end

  def self.return_tweet_object_by_id(id)
    TCLIENT.status(id)
  end

end
