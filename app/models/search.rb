class Search < ActiveRecord::Base
  belongs_to :user
  before_save :get_search_results


  def get_search_results
    self.youtube_url = Youtube.youtube_search(self.term)
  end

end
