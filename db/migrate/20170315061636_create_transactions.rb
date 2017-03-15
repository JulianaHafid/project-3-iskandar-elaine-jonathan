class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :request, foreign_key: true
      t.string :paymentgateway_id
      t.float :amount_paid

      t.timestamps
    end
  end
end
