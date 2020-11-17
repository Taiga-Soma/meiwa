class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string      :home_name,                 null: false
      t.date        :age_id,                    null: false
      t.string        :name,                      null: false
      t.string      :tal,                       null: false
      t.string      :email,                     null: false
      t.integer     :prefecture_id,             null: false
      t.integer     :category_id,               null: false
      t.integer     :class_id,                  null: false
      t.integer     :city_id,                   null: false
      t.integer     :address_id,                null: false
      t.integer     :price,                     null: false
      t.integer     :rate,                      null: false
      t.integer     :rent,                      null: false
      t.integer     :management,                null: false
      t.references  :user, foreign_key: true,   null: false
      t.timestamps
    end
  end
end
