class ChangeDecimalDatatypeInBills < ActiveRecord::Migration
  def change
    change_column :bills, :remaining_balance, :decimal, precision: 100, scale: 2
    change_column :bills, :amount_due, :decimal, precision: 100, scale: 2
  end
end
