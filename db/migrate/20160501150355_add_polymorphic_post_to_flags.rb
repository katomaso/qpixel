class AddPolymorphicPostToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :post, polymorphic: true, index: true
  end
end
