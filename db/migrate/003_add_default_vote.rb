class AddDefaultVote < ActiveRecord::Migration
  def self.up
    change_column :suggestions, :votes, :integer, :default => 1
  end

  def self.down
  end
end
