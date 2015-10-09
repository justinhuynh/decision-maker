class CreateChoiceSets < ActiveRecord::Migration
  def change
    create_table :choice_sets do |t|
      t.belongs_to :question, null: false
      t.belongs_to :choice, null: false

      t.timestamps null: false
    end
  end
end
