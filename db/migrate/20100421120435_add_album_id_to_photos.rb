class AddAlbumIdToPhotos < ActiveRecord::Migration
  
  def self.up
    add_column :photos, :photo_album_id, :integer
  end

  def self.down
    remove_column :photos, :photo_album_id
  end
  
end
