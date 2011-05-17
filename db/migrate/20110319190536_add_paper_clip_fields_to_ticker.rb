class AddPaperClipFieldsToTicker < ActiveRecord::Migration
  def self.up
    change_table :tickers do |t|
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
    end
  end

  def self.down
    remove_column :tickers, :picture_file_name
    remove_column :tickers, :picture_content_type
    remove_column :tickers, :picture_file_size
    remove_column :tickers, :picture_updated_at
  end
end
