class ChnageUser < ActiveRecord::Migration[5.1]
  change_table :users do |t|
    t.remove :password_hash
    t.remove :password_salt

    t.string :password_digest
  end
end
