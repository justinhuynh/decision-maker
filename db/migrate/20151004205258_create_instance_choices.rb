class CreateInstanceChoices < ActiveRecord::Migration
  def change
    create_table :instance_choices do |t|
      t.belongs_to :instance, null: false
      t.belongs_to :choice, null: false

      t.boolean :selected, default: false, null: false
      t.boolean :recommended, default: false, null: false
      t.timestamps null: false
    end
    add_index :instance_choices, [:instance_id, :choice_id], unique: true
    add_index :instance_choices, [:instance_id, :selected], unique: true, where: true
    add_index :instance_choices, [:instance_id, :recommended], unique: true, where: true
  end
end
