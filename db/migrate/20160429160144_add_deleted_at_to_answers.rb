class AddDeletedAtToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :deleted_at, :timestamp
  end
end
