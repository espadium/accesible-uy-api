class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :token
      t.string :email
      t.string :domain_name

      t.timestamps
    end
  end
end
