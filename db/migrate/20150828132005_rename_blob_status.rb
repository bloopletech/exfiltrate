class RenameBlobStatus < ActiveRecord::Migration
  def change
    rename_column :blobs, :status, :aasm_state
  end
end
