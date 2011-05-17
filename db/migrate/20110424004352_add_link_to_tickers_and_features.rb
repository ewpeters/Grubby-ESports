class AddLinkToTickersAndFeatures < ActiveRecord::Migration
  def self.up
    change_table :features do |t|
      t.string :link
    end
    change_table :tickers do |t|
      t.string :link
    end
    change_table :tvs do |t|
      t.string :link
    end
  end

  def self.down
    remove_column :features, :link
    remove_column :tickers, :link
    remove_column :tvs, :link
  end
end
