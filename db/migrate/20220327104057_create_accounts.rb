class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.integer :amount
      t.string :currency
      t.string :color

      t.timestamps
    end
  end
end
