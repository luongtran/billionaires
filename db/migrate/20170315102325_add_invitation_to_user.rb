class AddInvitationToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string   :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer  :invitation_limit
      t.integer  :invited_by_id
      t.string   :invited_by_type
    end
    add_index :users, :invitation_token, unique: true
    # Allow null encrypted_password
    change_column_null :users, :encrypted_password, :string, true
    # Allow null password_salt (add it if you are using Devise's encryptable module)
    change_column_null :users, :password_salt, :string, true
  end
end
