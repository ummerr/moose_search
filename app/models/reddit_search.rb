class RedditSearch < ActiveRecord::Base
  
  belongs_to :search

  def self.search(term, result_number)
    suffix = term.split(' ').join('+') + "&restrict_sr=off&sort=relevance&t=all"
    json_return = `curl http://www.reddit.com/search.json?q=#{suffix}`
    response = JSON.parse(json_return)
    if response["data"]["children"][result_number-1]
      return { title: response["data"]["children"][result_number - 1]["data"]["title"],
               url: response["data"]["children"][result_number - 1]["data"]["url"] }
    end
  end

end
