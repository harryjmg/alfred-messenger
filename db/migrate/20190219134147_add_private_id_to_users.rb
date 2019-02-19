class AddPrivateIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :private_id, :string
  end
end
