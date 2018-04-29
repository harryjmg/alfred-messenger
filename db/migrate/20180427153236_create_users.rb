class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :psid
      t.string :first_name
      t.string :last_name
      t.boolean :flow_testing

      t.timestamps
    end
  end
end
