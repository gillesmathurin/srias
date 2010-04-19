class AddDeliveredAtColumnToNewsletter < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :delivered_at, :datetime
  end

  def self.down
    remove_column :newsletters, :delivered_at
  end
end
