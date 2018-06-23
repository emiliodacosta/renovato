class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :project_id
      t.integer :contractor_id

      t.timestamps
    end
  end
end
