class AddVerificationKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :verification_key, :string
  end
end
