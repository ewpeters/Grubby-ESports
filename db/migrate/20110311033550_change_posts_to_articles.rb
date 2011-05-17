class ChangePostsToArticles < ActiveRecord::Migration
  def self.up
    rename_table :posts, :articles
  end

  def self.down
    rename_tabl :articles, :posts
  end
end
