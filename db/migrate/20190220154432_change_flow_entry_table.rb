class ChangeFlowEntryTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :flow_entries, :activity_categorty, :activity_category
  end
end
