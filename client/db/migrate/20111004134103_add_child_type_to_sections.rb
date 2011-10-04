class AddChildTypeToSections < ActiveRecord::Migration
  
  def self.up
    add_column :sections, :page_type_name, :string
  end

  def self.down
    remove_column :sections, :page_type_name
  end
  
end
