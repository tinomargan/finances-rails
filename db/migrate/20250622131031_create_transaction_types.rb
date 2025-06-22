class CreateTransactionTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :transaction_types do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
