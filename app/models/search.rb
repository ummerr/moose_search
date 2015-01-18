class Search < ActiveRecord::Base
  belongs_to :user
  has_many :RedditSearches
  before_save :get_search_results
  after_save :get_reddit_results

  def get_search_results

    self.youtube = Youtube.youtube_search(self.term)
    self.tweet = Tweet.twitter_search(self.term)

  end

  def self.all_by_date
    Search.all.order(created_at: :desc)
  end

  def date_posted
    self.created_at.strftime("%D %R %Z")
  end

  def get_reddit_results

    3.times do |num|
      reddit_results = RedditSearch.search(self.term, num + 1)
      RedditSearch.create(search_id: self.id, url: reddit_results[:url], title: reddit_results[:title])
    end

  end

end
