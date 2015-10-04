class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :title
      t.string :description, null: false
    end
    add_index :choices, :description, unique: true
  end
end
