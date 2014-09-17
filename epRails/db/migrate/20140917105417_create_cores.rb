class CreateCores < ActiveRecord::Migration
  def change
    create_table :cores do |t|
      t.string :hexid

      t.timestamps
    end
    add_index :cores, :hexid, :unique => true
  end
end
