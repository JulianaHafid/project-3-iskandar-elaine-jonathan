class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.integer :acceptor_id
      t.float :cost
      t.text :description
      t.text :status
      t.text :delivery_arrangement

      t.timestamps
    end
  end
end
