class AddUserToPrivileges < ActiveRecord::Migration[5.0]
  def change
    add_reference :privileges, :user, index: true, foreign_key: true
  end
end
