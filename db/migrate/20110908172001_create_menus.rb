class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.string :alias
      t.string :perma_link
      t.string :route
      t.integer :parent
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
