class CreateRedditSearches < ActiveRecord::Migration
  def change
    create_table :reddit_searches do |t|
      t.string :title
      t.string :url
      t.references :search
    end
  end
end
