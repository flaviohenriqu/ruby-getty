class AddIndexToInstrutorsEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :instrutors, :email, unique: true
  end
end
