class CreateRenovators < ActiveRecord::Migration[5.2]
  def change
    create_table :renovators do |t|
      t.string :firstName
      t.string :lastName
      t.string :email

      t.timestamps
    end
  end
end
