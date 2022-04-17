class AddCategoryIdToRecode < ActiveRecord::Migration[7.0]
  def change
    add_column :recodes, :category_id, :integer
    add_index :recodes, :category_id
  end
end
