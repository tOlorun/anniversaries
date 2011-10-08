class CreateCelebrities < ActiveRecord::Migration
  def self.up
    create_table :celebrities do |t|
      t.string :first_name
      t.string :last_name
      t.string :other_names
      t.string :primary_email
      t.string :other_emails
      t.string :mobile
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :celebrities
  end
end
