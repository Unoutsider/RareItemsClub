class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.text :image_path
      t.text :description
    end
  end
end
