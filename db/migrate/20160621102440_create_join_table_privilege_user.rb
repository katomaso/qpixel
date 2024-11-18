class CreateJoinTablePrivilegeUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :privileges, :users do |t|
      t.index [:privilege_id, :user_id]
      t.index [:user_id, :privilege_id]
    end
  end
end
