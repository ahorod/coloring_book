class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column :templates, :image_url
  end
end
