class AddDefaultToIsDeleted < ActiveRecord::Migration[5.0]
  def change
    change_column :answers, :is_deleted, :boolean, default: false
    change_column :comments, :is_deleted, :boolean, default: false
  end
end
