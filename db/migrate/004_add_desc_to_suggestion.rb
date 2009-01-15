class AddDescToSuggestion < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :desc, :string
  end

  def self.down
    remove_column :suggestions, :desc
  end
end
