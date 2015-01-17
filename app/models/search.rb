class Search < ActiveRecord::Base
  belongs_to :user
  before_save :get_search_results


  def get_search_results
    self.youtube = Youtube.youtube_search(self.term)
    self.tweet_url = Tweet.twitter_search(string)
    # self.reddit_url = Reddit.search(self.term, 1)[:url]
  end

  def self.all_by_date
    Search.all.order(created_at: :desc)
  end

  def date_posted
    self.created_at.strftime("%D %R %Z")
  end

end
