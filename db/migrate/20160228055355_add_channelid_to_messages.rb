class AddChannelidToMessages < ActiveRecord::Migration
  def change
	  add_column :messages, :channel_id, :integer
	  add_foreign_key :messages, :channels
  end
end
