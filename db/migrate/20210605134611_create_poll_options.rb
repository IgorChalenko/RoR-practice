class CreatePollOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :poll_options do |t|
      t.integer :vote
      t.belongs_to :poll, foreign_key: true
      t.timestamps
    end
  end
end
