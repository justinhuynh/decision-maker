class UpdateQueriesChoiceColumns < ActiveRecord::Migration
  def up
    change_table :queries do |t|
      t.references :selected_choice, null: false
      t.references :recommended_choice, null: false
      t.remove :choice_id
    end
  end

  def down
    change_table :queries do |t|
      t.remove :selected_choice_id
      t.remove :recommended_choice_id
      t.belongs_to :choice, null: false
    end
  end
end
