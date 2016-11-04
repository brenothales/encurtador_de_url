class CreateStats < ActiveRecord::Migration[5.0]
  def change
    create_table :stats do |t|
      t.integer :hits
      t.text :url
      t.string :shorturl
      t.string :sanitized_url

      t.timestamps
    end
  end
end
