class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :searches, :youtube_url, :youtube
    rename_column :searches, :tweet_url, :tweet

  end
end
