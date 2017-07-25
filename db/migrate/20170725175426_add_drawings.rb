class AddDrawings < ActiveRecord::Migration[5.1]
  def change
    create_table :drawings do |t|
     t.string :user_id
     t.string :template_id
    
     t.timestamps
 end
  end
end
