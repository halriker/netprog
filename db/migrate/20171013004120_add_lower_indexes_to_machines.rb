class AddLowerIndexesToMachines < ActiveRecord::Migration[5.1]
  def change
  	add_index :machines, "lower(machine_name) varchar_pattern_ops"
  end
end

