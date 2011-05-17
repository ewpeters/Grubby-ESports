class FixPlayerNameMedia < ActiveRecord::Migration
  def self.up
    rename_column :medias, :player_two, :player_two_name
  end

  def self.down
    rename_column :medias, :player_two_name, :player_two
  end
end
