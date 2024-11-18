class AddReceivingUserToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :recv_user, :integer
  end
end
