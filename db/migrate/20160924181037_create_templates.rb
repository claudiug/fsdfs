class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.boolean :active
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
