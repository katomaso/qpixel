class AddPolymorphicPostToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :post, polymorphic: true, index: true
  end
end
