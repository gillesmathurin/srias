class AddAttachmentLogopicToPrestataires < ActiveRecord::Migration
  def self.up
    change_table :prestataires do |t|
      t.has_attached_file :logopic
    end
  end

  def self.down
    drop_attached_file :prestataires, :logopic
  end
end
