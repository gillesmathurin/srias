class AddAttachmentInformationFileToInformation < ActiveRecord::Migration
  def self.up
    change_table :information do |t|
      t.has_attached_file :information_file
    end
  end

  def self.down
    drop_attached_file :information, :information_file
  end
end
