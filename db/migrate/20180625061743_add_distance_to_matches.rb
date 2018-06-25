class AddDistanceToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :distance, :decimal
  end
end
