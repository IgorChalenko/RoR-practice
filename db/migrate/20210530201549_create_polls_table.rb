class CreatePollsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
