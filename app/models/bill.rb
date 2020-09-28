class Bill < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :remaining_balance, :amount_due, :due_date, :category
end
