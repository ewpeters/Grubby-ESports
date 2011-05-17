class RemoveTypeFromDownloadsTable < ActiveRecord::Migration
  def self.up
    remove_column :downloads, :type
    remove_column :tvs, :type
  end

  def self.down
    add_column :downloads, :type, :string
    add_column :tvs, :type, :string
  end
end
