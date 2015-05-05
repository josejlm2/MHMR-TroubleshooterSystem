class RemoveTicketsCategoryIdFromTickets < ActiveRecord::Migration
  def up
    remove_column :tickets, :ticket_category_id
  end

  def down
    add_column :tickets, :ticket_category_id, :integer
  end
end
