class AddDefaultFalseValueToNotifications < ActiveRecord::Migration[5.0]
  def change
    change_column :notifications, :is_read, :boolean, default: false
  end
end
