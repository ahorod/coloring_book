class CreateColoringTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.column :tag, :string
      t.column :image_url, :string

      t.timestamps
    end
  end
end
