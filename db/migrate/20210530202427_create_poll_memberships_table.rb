class CreatePollMembershipsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :poll_memberships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :poll, foreign_key: true
      t.belongs_to :poll_option, foreign_key: true, null: true
      t.timestamps
    end
  end
end
