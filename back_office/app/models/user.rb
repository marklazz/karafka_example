class User < ApplicationRecord

  def self.calculate_hash(unencrypted_password, salt)
    combo = "#{unencrypted_password}#{salt.upcase}"
    Digest::SHA512.digest(combo.bytes.zip(([0]*combo.size)).flatten.pack('C*').force_encoding('UTF-16LE'))
  end

  def self.admin_user
    first
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
