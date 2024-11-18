class AddNameToPrivileges < ActiveRecord::Migration[5.0]
  def change
    add_column :privileges, :name, :string
  end
end
