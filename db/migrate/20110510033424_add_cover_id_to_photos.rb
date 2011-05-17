class AddCoverIdToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.integer :cover_id
    end
  end

  def self.down
    remove_column :photos, :cover_id
  end
end
