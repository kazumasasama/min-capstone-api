class AddImageIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_id, :integer
  end
end
