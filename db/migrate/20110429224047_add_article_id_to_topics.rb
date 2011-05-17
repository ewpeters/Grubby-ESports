class AddArticleIdToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.integer :article_id
    end
  end

  def self.down
    remove_column :topics, :article_id
  end
end
