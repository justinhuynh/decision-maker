class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
