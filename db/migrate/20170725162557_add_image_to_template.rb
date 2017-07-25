class AddImageToTemplate < ActiveRecord::Migration[5.1]
  def up
    add_attachment :templates, :image
  end

  def down
    remove_attachment :templates, :image
  end
end
