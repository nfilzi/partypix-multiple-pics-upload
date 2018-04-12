class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :room, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
