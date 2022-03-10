class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.date :from
      t.date :to
      t.boolean :cancelled, default: false
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
