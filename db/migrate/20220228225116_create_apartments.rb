class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name, default: "", null: false
      t.string :image, default: "", null: false
      t.string :interior, default: [], null: false, array: true
      t.decimal :maintenance_fee, default: 0, null: false
      t.decimal :monthly_rent, default: 0, null: false
      t.string :city, default: "", null: false
      t.date :reservation_expiry_date, default: "", null: false

      t.timestamps
    end
  end
end
