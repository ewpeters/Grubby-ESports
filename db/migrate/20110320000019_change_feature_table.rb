class ChangeFeatureTable < ActiveRecord::Migration
  def self.up
    remove_column :features, :title
    remove_column :features, :tag_line
    change_table :features do |t|
      t.string :title
      t.string :tag_line
      t.text :summary
    end
    remove_column :features, :html_file_name
    remove_column :features, :html_content_type
    remove_column :features, :html_file_size
    remove_column :features, :html_updated_at
  end

  def self.down
  end
end
