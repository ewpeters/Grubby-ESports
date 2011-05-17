class AddMediaTable < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.string   :type
      t.string   :player_one_name
      t.string   :player_one_race
      t.string   :player_two
      t.string   :player_two_race
      t.string   :game
      t.datetime :display_date
      t.integer  :downloaded
      t.string   :title
      t.text     :summary
      t.string   :media_file_file_name
      t.string   :media_file_content_type
      t.integer  :media_file_file_size
      t.datetime :media_file_updated_at
      t.timestamps
    end
    change_table :permissions do |t|
      t.boolean :can_manage_tv, :default => false
    end
  end

  def self.down
    drop_table :medias
    remove_column :permisisons, :can_manage_tv
  end
end
