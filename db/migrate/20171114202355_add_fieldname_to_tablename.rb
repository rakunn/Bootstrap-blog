class AddFieldnameToTablename < ActiveRecord::Migration[5.0]
  def change
    add_column :trip_images, :article_id, :integer
  end
end
