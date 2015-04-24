class RemoveStatusFromTickets < ActiveRecord::Migration
  def up
    remove_column :tickets, :status
  end

  def down
    add_column :tickets, :status, :string
  end
end
