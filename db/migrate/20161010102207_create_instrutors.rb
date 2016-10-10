class CreateInstrutors < ActiveRecord::Migration[5.0]
  def change
    create_table :instrutors do |t|
      t.string :nome
      t.string :email
      t.string :profissao

      t.timestamps
    end
  end
end
