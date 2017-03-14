class CreateJetTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :jet_types do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.attachment :image

      t.timestamps
    end
  end
end
