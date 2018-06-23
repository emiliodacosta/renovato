class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :zipCode
      t.boolean :intSvcs
      t.boolean :archSvcs
      t.boolean :gcSvcs
      t.decimal :budget, precision: 10, scale: 2
      t.integer :renovator_id

      t.timestamps
    end
  end
end
