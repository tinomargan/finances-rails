class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :payment_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :name
      t.decimal :amount
      t.datetime :event_date
      t.datetime :payment_date

      t.timestamps
    end
  end
end
