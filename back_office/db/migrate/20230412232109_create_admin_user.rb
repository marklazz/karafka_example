class CreateAdminUser < ActiveRecord::Migration[6.1]
  def up
    salt = SecureRandom.hex(10)
    User.create!(
      first_name: 'Admin',
      last_name: 'User',
      active: true,
      email: 'admin@admin.com',
      salt: salt,
      password_hash: User.calculate_hash('admin', salt)
    )
  end

  def down
    User.where(email: 'admin@admin.com').destroy_all
  end
end
