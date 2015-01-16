class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :term
      t.string :youtube_url
      t.string :tweet_url
      t.string :reddit_url
      t.references :user

      t.timestamps
    end
  end
end
