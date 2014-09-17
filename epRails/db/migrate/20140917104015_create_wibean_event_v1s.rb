class CreateWibeanEventV1s < ActiveRecord::Migration
  def change
    create_table :wibean_event_v1s do |t|
      t.string :name
      t.string :data
      t.integer :ttl
      t.datetime :published_at
      t.string :hexid
      t.belongs_to :core

      t.timestamps
    end
  end
end
