class FixForeginKeysForArticle < ActiveRecord::Migration
  def self.up
    remove_column :tickers, :article_id
    remove_column :features, :article_id
    change_table :articles do |t|
      t.integer :ticker_id
      t.integer :feature_id
    end
  end

  def self.down
    remove_column :articles, :ticker_id
    remove_column :articles,:feature_id
  end
end
