class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.binary :password_hash
      t.string :salt

      t.timestamps
    end
  end
end
