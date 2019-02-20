class AddColumnsToFlowEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :flow_entries, :activity_name, :string
    add_column :flow_entries, :activity_categorty, :string

    add_column :flow_entries, :challenge_level, :integer
    add_column :flow_entries, :skill_level, :integer

    add_column :flow_entries, :feeling_competent, :integer
    add_column :flow_entries, :mentally_absorbed, :integer
    add_column :flow_entries, :clear_objectives, :integer
    add_column :flow_entries, :control_situation, :integer
    add_column :flow_entries, :free_from_ego, :integer
    add_column :flow_entries, :free_from_time, :integer
    add_column :flow_entries, :clear_conditions, :integer
    add_column :flow_entries, :great_experience, :integer

    add_column :flow_entries, :is_voluntary, :boolean
    add_column :flow_entries, :happiness_level, :integer
    add_column :flow_entries, :social_quality, :integer, default: nil
  end
end
