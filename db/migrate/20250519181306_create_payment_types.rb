class CreatePaymentTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_types do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
