class CreatePollMembershipsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :poll_memberships do |t|
      t.belongs_to :user
      t.belongs_to :poll

      t.timestamps
    end
  end
end
