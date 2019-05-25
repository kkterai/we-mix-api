class CreateUsers < ActiveRecord::Migration[5.1]
  
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') 
    create_table :users, id: :uuid,  default: 'gen_random_uuid()' do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      
      t.timestamps
    end
  end
end
