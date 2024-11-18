class AddPostToPostHistory < ActiveRecord::Migration[5.0]
  def change
    add_reference :post_histories, :post, polymorphic: true, index: true
  end
end
