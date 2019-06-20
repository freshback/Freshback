class CreateKeshbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :keshbacks do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :link
      t.string :count

      t.timestamps
    end
  end
end
