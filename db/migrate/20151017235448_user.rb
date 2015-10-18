class User < ActiveRecord::Migration
  def change
  	create_table :user do |t|
  		t.string :username, :limit => 60, :null => false
  		t.string :password, :limit => 60, :null => false
  		t.string :name, :limit => 100, :null => false
  		t.string :email, :limit => 100, :null => false
  	end
  end
end
