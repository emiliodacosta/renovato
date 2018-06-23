class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :companyName
      t.string :email
      t.string :zipCode
      t.boolean :intSvcs
      t.boolean :archSvcs
      t.boolean :gcSvcs

      t.timestamps
    end
  end
end
