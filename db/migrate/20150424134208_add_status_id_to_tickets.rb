class AddStatusIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :status_id, :integer
  end
end
