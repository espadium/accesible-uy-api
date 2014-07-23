class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :author, index: true
      t.references :place, index: true
      t.boolean :accurate

      t.timestamps
    end
  end
end
