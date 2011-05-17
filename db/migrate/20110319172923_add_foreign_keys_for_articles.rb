class AddForeignKeysForArticles < ActiveRecord::Migration
  def self.up
    change_table :tickers do |t|
      t.integer :article_id
    end
    change_table :features do |t|
      t.integer :article_id
    end
  end

  def self.down
    remove_column :tickers, :article_id
    remove_column :features, :article_id
  end
end
