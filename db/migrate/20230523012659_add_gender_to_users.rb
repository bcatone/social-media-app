class AddGenderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gender, :string, default: "U"
    add_column :users, :pronouns, :string
  end
end
