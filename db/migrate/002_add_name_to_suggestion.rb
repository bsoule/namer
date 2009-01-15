class AddNameToSuggestion < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :name, :string
  end

  def self.down
    remove_column :suggestions, :name
  end
end
