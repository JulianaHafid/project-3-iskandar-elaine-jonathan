class AddDetailsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :time, :time
    add_column :events, :image_url, :string
  end
end
