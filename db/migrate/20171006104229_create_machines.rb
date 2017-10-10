class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.string :machine_name, null: false
      t.string :ip_address
      t.string :mac_address
      t.string :machine_make
      t.string :machine_model
      t.string :machine_serialno

      t.timestamps
    end
    add_index :machines, :machine_name, unique: true
  end
end
