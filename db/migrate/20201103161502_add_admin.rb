class AddAdmin < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :event_admin, index: true
  end
end
