class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_name
      t.decimal :remaining_balance
      t.decimal :amount_due
      t.date :due_date
    end
  end
end
