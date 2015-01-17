module Tweet

  TCLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        =
    config.consumer_secret     =
    config.access_token        =
    config.access_token_secret =
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
