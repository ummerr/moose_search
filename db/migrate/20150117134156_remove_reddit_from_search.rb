class RemoveRedditFromSearch < ActiveRecord::Migration
  def change
    change_table :searches do |t|
      t.remove :reddit_url
    end
  end
end
