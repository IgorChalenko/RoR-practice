class AddVoteCountToPoll < ActiveRecord::Migration[6.1]
  def change
    add_column :polls, :vote_count, :integer
  end
end
