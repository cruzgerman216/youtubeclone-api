class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.text :description
      t.string :image
      t.string :banner

      t.timestamps
    end
  end
end
