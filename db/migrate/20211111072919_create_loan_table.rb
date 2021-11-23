class CreateLoanTable < ActiveRecord::Migration[5.2]
  def up
    create_table :loans do |t|
      t.string :email
      t.string :pan_card
      t.bigint :aadhar_number
      t.integer :bank_account_number
      t.string :bank_ifsc
      t.integer :monthly_recurring_inflow
      t.integer :monthly_recurring_outflow
      t.integer :user_id
      t.integer :credit_score
      t.integer :credit_limit
      t.boolean :approved, :default => false
    end
  end
  def down
    drop_table :loans
  end
end
