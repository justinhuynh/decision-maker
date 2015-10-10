class RemoveNullConstraintsOnQuery < ActiveRecord::Migration
  def change
    change_column_null :queries, :rating, true
    change_column_null :queries, :selected_choice_id, true
    change_column_null :queries, :recommended_choice_id, true
  end
end
