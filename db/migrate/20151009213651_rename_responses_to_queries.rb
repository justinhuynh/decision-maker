class RenameResponsesToQueries < ActiveRecord::Migration
  def up
    rename_table :responses, :queries
  end

  def down
    rename_table :queries, :responses
  end
end
