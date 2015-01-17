class Search < ActiveRecord::Base
  belongs_to :user
  before_save :get_search_results


  def get_search_results string
    self.youtube_url = Youtube.youtube_search(string)
    self.tweet_url = Tweet.twitter_search(string)
  end

end
