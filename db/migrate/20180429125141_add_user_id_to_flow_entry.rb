class AddUserIdToFlowEntry < ActiveRecord::Migration[5.1]
  def change
  	add_column :flow_entries, :user_id, :integer
  end
end
