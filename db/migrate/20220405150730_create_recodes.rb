class CreateRecodes < ActiveRecord::Migration[7.0]
  def change
    create_table :recodes do |t|

      t.string :recode_type
      t.text :category
      t.integer :amount
      t.datetime :date_time
      t.text  :note


      t.timestamps
    end
  end
end
