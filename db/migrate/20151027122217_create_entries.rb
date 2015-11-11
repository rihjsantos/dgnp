class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :entry
      t.text :description
      t.text :funny_description
      t.integer :category_id    	
      t.timestamps null: false
    end

    add_foreign_key :entries, :categories
  end
end
