class AddBodyIdToBlob < ActiveRecord::Migration
  def change
    rename_column :blobs, :response_body_path, :response_body_id
  end
end
