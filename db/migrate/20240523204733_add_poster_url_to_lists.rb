class AddPosterUrlToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :post_url, :string
  end
end
