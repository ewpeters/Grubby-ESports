class AddImageUrlToForums < ActiveRecord::Migration
  def self.up
    change_table :forums do |t|
      t.string :background_image
    end
  end

  def self.down
    remove_column :forums, :background_image
  end
end
