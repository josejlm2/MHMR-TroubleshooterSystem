class AddDeletedAtToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :deleted_at, :datetime
    add_index :statuses, :deleted_at
  end
end
