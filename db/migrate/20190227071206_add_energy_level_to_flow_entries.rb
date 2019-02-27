class AddEnergyLevelToFlowEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :flow_entries, :energy_level, :integer
  end
end
