class CreateTicketsForeignKeys < ActiveRecord::Migration
  def up
    change_table :tickets do |t|
      t.integer 'location_id'
      t.integer 'ticket_category_id'
    end
  end

  def down
    remove_column :tickets, :location_id
    remove_column :tickets, :ticket_category_id
  end
end
