class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :status, default: 'В процессе'
    end
  end
end
