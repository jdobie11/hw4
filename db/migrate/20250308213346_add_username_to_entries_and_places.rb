class AddUsernameToEntriesAndPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :username, :string
    add_column :places, :username, :string
  end
end
