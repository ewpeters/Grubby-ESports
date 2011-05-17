class AddTvTable < ActiveRecord::Migration
  def self.up
    create_table :tvs do |t|
      t.string   :type
      t.string   :from
      t.text     :summary
      t.string   :video_type
      t.string   :game
      t.datetime :display_date
      t.integer  :downloaded
      t.string   :title
      t.timestamps
    end
  end

  def self.down
    drop_table :tvs
  end
end
