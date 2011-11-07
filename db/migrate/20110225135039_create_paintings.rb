class CreatePaintings < ActiveRecord::Migration
  def self.up
    create_table :paintings do |t|
      t.integer :gallery_id

      t.string :title
      t.string :author

      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :paintings
  end
end
