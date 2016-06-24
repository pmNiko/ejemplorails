class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_type
      t.string :number
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
