class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string      :buildingname,              null: false
      t.date        :age,                       null: false
      t.string      :name,                      null: false
      t.string      :tel,                       null: false
      t.string      :email,                     null: false
      t.integer     :prefecture_id,             null: false
      t.integer     :zone_id,                   null: false
      t.string      :city
      t.string      :address,                   null: false
      t.integer     :price,                     null: false
      t.integer     :rate,                      null: false
      t.integer     :rent,                      null: false
      t.integer     :management,                null: false
      t.integer     :resident_id,               null: false
      t.references  :user,                      foreign_key: true
      t.timestamps
    end
  end
end
