class AddDeletedAtToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :deleted_at, :timestamp
  end
end
