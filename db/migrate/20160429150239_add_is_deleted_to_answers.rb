class AddIsDeletedToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :is_deleted, :boolean
  end
end
