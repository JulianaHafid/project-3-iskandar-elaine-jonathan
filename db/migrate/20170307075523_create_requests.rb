class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.belongs_to :event, foreign_key: true
      t.references :requestor, index:true
      t.references :standin, index:true
      t.float :cost
      t.text :description
      t.text :status
      t.text :delivery_arrangement
      t.text :image_url

      t.timestamps
    end
  end
end
