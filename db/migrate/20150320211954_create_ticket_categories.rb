class CreateTicketCategories < ActiveRecord::Migration
  def up
    create_table 'ticket_categories' do |t|
      t.string 'name'
    end
  end


  def down
    drop_table 'ticket_categories'
  end
end
