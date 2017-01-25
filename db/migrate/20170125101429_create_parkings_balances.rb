class CreateParkingsBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :parkings_balances do |t|
      t.decimal :total_balance
      t.decimal :monthly_balance
      t.decimal :daily_balance
      t.timestamps
    end
  end
end
