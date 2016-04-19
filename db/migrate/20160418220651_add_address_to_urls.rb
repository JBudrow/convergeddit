class AddAddressToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :address, :string 
  end
end
