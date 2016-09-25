class CreatePlaceholders < ActiveRecord::Migration[5.0]
  def change
    create_table :placeholders do |t|
      t.string :name
      t.boolean :active
      t.integer :template_id
      t.timestamps
    end
  end
end
