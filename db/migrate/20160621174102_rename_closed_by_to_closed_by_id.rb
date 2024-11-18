class RenameClosedByToClosedById < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :closed_by, :closed_by_id
  end
end
