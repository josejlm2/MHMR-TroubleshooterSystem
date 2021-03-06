class CreateTickets < ActiveRecord::Migration
  def up
    create_table 'tickets' do |t|
      t.string 'requestor'
      t.string 'phone'
      t.integer 'ru'
      t.string 'email'
      t.string 'room'
      t.string 'subject'
      t.text 'description'
    end

  end
  
  def down
    drop_table 'tickets'
  end
end
