class AddFlagToFlagStatuses < ActiveRecord::Migration[5.0]
  def change
    add_reference :flag_statuses, :flag, index: true, foreign_key: true
  end
end
