class AddPosToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.integer :position
    end
  end

  def self.down
    remove_column :albums, :position
  end
end
