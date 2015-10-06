class MakeUserOptionalInstance < ActiveRecord::Migration
  def up
    change_column_null :instances, :user_id, true
  end
  def down
    change_column_null :instances, :user_id, false
  end
end
