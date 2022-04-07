class AddAccountIdToRecode < ActiveRecord::Migration[7.0]
  def change
    add_column :recodes, :account_id, :integer
    add_index :recodes, :account_id
  end
end
