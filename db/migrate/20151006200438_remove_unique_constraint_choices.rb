class RemoveUniqueConstraintChoices < ActiveRecord::Migration
  def up
    remove_index :choices, :description
  end
  def down
    add_index :choices, :description, unique: true
  end
end
