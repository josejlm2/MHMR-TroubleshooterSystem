class AddDeletedAtToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :deleted_at, :datetime
    add_index :emails, :deleted_at
  end
end
