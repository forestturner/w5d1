class FixUserTable < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :session_token, :string

    add_column :goals, :body, :text
    add_column :goals, :user_id, :integer
  end
end
