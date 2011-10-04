class AddPhotoTextToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :photo_text, :string
  end

  def self.down
    remove_column :pages, :photo_text
  end
end