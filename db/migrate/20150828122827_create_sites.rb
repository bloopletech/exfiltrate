class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :name
      t.text :url
      t.timestamps
    end
  end
end
