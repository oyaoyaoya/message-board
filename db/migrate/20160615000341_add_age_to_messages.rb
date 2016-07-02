class AddAgeToMessages < ActiveRecord::Migration
  def change
    # add_column :messages, :integer
    add_column :messages, :age, :string
  end
end
