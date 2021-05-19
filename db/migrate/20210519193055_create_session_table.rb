class CreateSessionTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :token, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
