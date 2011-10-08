class CreateAnniversaries < ActiveRecord::Migration
  def self.up
    create_table :anniversaries do |t|
      t.references :celebrity
      t.string :anniversary_type
      t.datetime :anniversary_date
      t.text :message
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :anniversaries
  end
end
