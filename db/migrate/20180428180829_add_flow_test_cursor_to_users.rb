class AddFlowTestCursorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :flow_test_cursor, :integer
    add_column :users, :flow_test_intervals, :string
  end
end
