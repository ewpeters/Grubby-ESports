class AddRemoteImageToTv < ActiveRecord::Migration
  def self.up
    change_table :tvs do |t|
      t.string :image_remote_url
    end
  end

  def self.down
    remove_column :tvs, :image_remote_url
  end
end
