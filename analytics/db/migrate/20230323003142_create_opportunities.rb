class CreateOpportunities < ActiveRecord::Migration[6.1]
  def change
    create_table :opportunities do |t|
      t.string :user_first_name
      t.string :user_last_name
      t.integer :user_age
      t.string :user_gender

      t.string :client_company
      t.string :client_location
      t.string :client_role
      t.string :client_industry

      t.integer :contract_length
      t.integer :contract_value

      t.timestamps
    end
  end
end
