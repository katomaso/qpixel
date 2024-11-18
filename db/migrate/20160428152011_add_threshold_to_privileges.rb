class AddThresholdToPrivileges < ActiveRecord::Migration[5.0]
  def change
    add_column :privileges, :threshold, :integer
  end
end
