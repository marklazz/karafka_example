class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :contact_name
      t.string :location
      t.string :phone
      t.string :company
      t.string :role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
