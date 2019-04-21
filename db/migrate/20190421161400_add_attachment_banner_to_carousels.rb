class AddAttachmentBannerToCarousels < ActiveRecord::Migration[5.2]
  def self.up
    change_table :carousels do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :carousels, :banner
  end
end
