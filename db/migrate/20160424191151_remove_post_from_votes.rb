class RemovePostFromVotes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :votes, :post, index: true, foreign_key: true
  end
end
