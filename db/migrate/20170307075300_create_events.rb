class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.belongs_to :user, foreign_key: true
      t.text :name
      t.text :location
      t.date :date

      t.timestamps
    end
  end
end
