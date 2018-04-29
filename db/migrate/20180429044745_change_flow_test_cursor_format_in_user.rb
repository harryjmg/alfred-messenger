class ChangeFlowTestCursorFormatInUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :flow_test_cursor, :string
  end
end
