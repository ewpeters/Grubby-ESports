class AddPositionToFeaturesAndTickers < ActiveRecord::Migration
  def self.up
    change_table :tickers do |t|
      t.integer :position
    end
    change_table :features do |t|
      t.integer :position
    end
  end

  def self.down
    remove_column :tickers, :position
    remove_column :features, :position
  end
end
