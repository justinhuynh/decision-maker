class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :outcome_rating
      t.belongs_to :user, null: false
      t.belongs_to :question, null: false

      t.timestamps null: false
    end
  end
end
