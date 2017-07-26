class AddImageToDrawing < ActiveRecord::Migration[5.1]
  def up
    add_attachment :drawings, :image
  end

  def down
    remove_attachment :drawings, :image
  end
end
