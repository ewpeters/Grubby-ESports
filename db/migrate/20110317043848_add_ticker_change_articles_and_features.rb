class AddTickerChangeArticlesAndFeatures < ActiveRecord::Migration
  def self.up
    remove_column :articles, :summary
    remove_column :articles, :tag_line
    remove_column :articles, :picture_file_name
    remove_column :articles, :picture_content_type
    remove_column :articles, :picture_file_size
    remove_column :articles, :picture_updated_at
    change_table :articles do |t|
      t.string :type
      t.string :author
    end
    create_table :tickers do |t|
      t.string :title_small
      t.text :tagline_small
      t.string :title
      t.text :summary
      t.string :title_list
    end
    change_table :features do |t|
      t.string :title_top
    end
  end

  def self.down
    change_table :articles do |t|
      t.string :summary
      t.string :tag_line
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
    end
    remove_column :articles, :type
    remove_column :articles, :author
    drop_table :tickers
    remove_column :features, :title_top
  end
end
