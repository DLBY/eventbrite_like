class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :strip_customer_id
      #t.references :user, foreign_key :true
      #t.references :event, foreign_key :true

      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
