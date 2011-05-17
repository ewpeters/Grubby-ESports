class AddChatEmbedToTv < ActiveRecord::Migration
  def self.up
    change_table :tvs do |t|
      t.text :chat_code
    end
  end

  def self.down
    remove_column :tvs, :chat_code
  end
end
