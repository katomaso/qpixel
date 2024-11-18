class AddPostToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :post, polymorphic: true, index: true
  end
end
