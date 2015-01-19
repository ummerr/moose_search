class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :reddit_searches, :title, :text
    change_column :reddit_searches, :url, :text
  end
end
