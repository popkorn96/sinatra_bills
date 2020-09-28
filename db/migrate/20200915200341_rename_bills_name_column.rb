class RenameBillsNameColumn < ActiveRecord::Migration
  def change
    rename_column :bills, :bill_name, :name
  end
end
