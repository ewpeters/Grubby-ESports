class AddEmbededSourceToTv < ActiveRecord::Migration
  def self.up
    change_table :tvs do |t|
      t.text :embeded
    end
  end

  def self.down
    remove_column :tvs, :embeded
  end
end
