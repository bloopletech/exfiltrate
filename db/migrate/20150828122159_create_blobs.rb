class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs do |t|
      t.integer :site_id
      t.text :url
      t.text :status
      t.json :request_headers
      t.text :request_body
      t.integer :response_code
      t.json :response_headers
      t.text :response_body_path
      t.timestamp :requested_at
      t.timestamps
    end
  end
end
