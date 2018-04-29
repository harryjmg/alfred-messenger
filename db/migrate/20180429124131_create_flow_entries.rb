class CreateFlowEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :flow_entries do |t|
      t.string :what
      t.string :feeling
      t.string :flow

      t.timestamps
    end
  end
end
