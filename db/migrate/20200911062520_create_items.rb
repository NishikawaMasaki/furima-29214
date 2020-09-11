class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false  
      t.text :explain, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :delivery, null: false
      t.integer :area, null: false
      t.integer :day, null: false
      t.integer :price, null: false
      #t.reference :user null: false, foreign_key :true
      t.timestamps
    end
  end
end
