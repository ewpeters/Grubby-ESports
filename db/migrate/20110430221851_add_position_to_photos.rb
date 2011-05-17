class AddPositionToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.integer :position
    end
  end

  def self.down
    remove_column :photos, :position
  end
end
