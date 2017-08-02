class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :booking_code, :index => true
      t.integer :train_id, :index => true
      t.integer :seat_number, :index => true
      t.integer :user_id, :index => true
      t.integer :customer_name
      t.integer :customer_phone
      t.timestamps
    end
  end
end
