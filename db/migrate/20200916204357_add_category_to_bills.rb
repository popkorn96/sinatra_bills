class AddCategoryToBills < ActiveRecord::Migration
  def change
    add_column :bills, :category, :string
  end
end
