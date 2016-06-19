class AddAgeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :integer
  end
end
