class Celebrity < ActiveRecord::Base

	has_many :anniversaries

	validates_presence_of :first_name

end
