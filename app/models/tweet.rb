module Tweet

  TCLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = "Dz1vcQeQjtyuYv4Y0s8uSbJR8"
    config.consumer_secret     = "PsoklQM9enuWcyCh75Q8dLwydPysKgfIlllMUvtbyjQyIG0qzV"
    config.access_token        = "204986879-nVYxDYg4PlsQnxLIV49s2DzmCkwf9cijlnY7ogHX"
    config.access_token_secret = "qd1Z6MJceCbi9QKp0TLOS02356u7DTLGmiYqTiuf6VFHq"
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
