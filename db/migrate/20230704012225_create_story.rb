class CreateStory < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.datetime :time
      t.integer :score
      t.string :uuid
      t.integer :rank
      t.boolean :is_active, default: true, null: false # this should be status, a enumerable but for simplicity we'll use a boolean

      t.timestamps
    end
  end
end
