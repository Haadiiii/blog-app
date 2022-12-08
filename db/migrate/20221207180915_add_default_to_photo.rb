class AddDefaultToPhoto < ActiveRecord::Migration[7.0]
  def self.up
    change_column :users, :photo, :string, :default => "http://www.gravatar.com/avatar/?d=mp&s=128"
  end

  def self.down
  change_column :users, :photo, :string, :default => ""
  end
end
