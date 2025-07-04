class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
