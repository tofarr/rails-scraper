class CreateUrlInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :url_infos do |t|
      t.string :url, null: false
      t.string :title
      t.text :description
      t.string :thumbnail_url

      t.timestamps
    end
    add_index :url_infos, :url, unique: true
  end
end
