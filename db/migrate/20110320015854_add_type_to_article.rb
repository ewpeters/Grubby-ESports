class AddTypeToArticle < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.string :article_type
    end
  end

  def self.down
  end
end
